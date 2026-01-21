from sys import argv
from os import path
from re import match
from dataclasses import dataclass

@dataclass
class Label:
    name: str
    input: bool
    width: int
    format: str
    signed: bool
    
    @staticmethod
    def format_string(labels) -> str:
        return '|' + '|'.join(f'%{l.format}' for l in labels) + '|'

    @staticmethod
    def parameters(labels) -> str:
        return ', '.join(l.name for l in labels)

    @staticmethod
    def defs(labels) -> str:
        d = {l.typ():[] for l in labels}
        for l in labels:
            d[l.typ()].append(l)
        res = ''
        for (k, v) in d.items():
            names = ', '.join(l.name for l in v)
            res += indented(f'{k} {names};\n')
        return res
    
    def assign(self, value):
        if self.format == 'd':
            return f'{self.name} = {value};'
        return f'{self.name} = {self.width}\'{self.format}{value};'
    
    def typ(self):
        io = 'reg' if self.input else 'wire'
        return io + (' signed' if self.signed else '' ) + f' [{self.width - 1}:0]' if self.width != 1 else io
    
    def is_time(self):
        return self.name == 'time'

    def not_time(self):
        return self.name != 'time'

    def is_input(self):
        return self.input

    def is_output(self):
        return not self.input

default_time = object()
last_t_str = ''
def display(labels, time = default_time, t_str = ''):
    global global_time, last_t_str
    if time is default_time:
        time = global_time
    delay = 0 if t_str == last_t_str and t_str != '' else 1
    write_indented(f'#{delay} $display("{t_str}{Label.format_string(labels)}", {Label.parameters(labels)});')
    global_time += 1
    last_t_str = t_str

def read_cmp_file(filepath: str):
    labels: list[Label] = []
    lines: list[list[str]] = []
    header_string = ""
    with open(filepath, 'r') as file:
        def split_line(line: str) -> list[str]:
            sections = map(lambda s: s.strip(), line.split('|'))
            valid_sections = filter(lambda s: len(s) > 0, sections)
            return list(valid_sections)

        header_string = file.readline().strip().replace(' ', '')
        for name in split_line(header_string):
            if name == 'time':
                global time_field
                time_field = True
                continue
            print('----', name, '----')
            is_in = name == 'in' or (input('in/out [in]: ').strip() or 'in') == 'in' if name != 'out' else False

            label_fmt = input('d/sd/b/h [b]: ').strip() or 'b'
            signed = label_fmt == 'sd'
            if signed:
                label_fmt = 'd'

            default_bits = 16 if label_fmt == 'd' else 1
            label_bits = int(input(f'bits [{default_bits}]: ') or default_bits)
            labels.append(Label(name, is_in, label_bits, label_fmt, signed))

        lines = list(map(split_line, file.readlines()))
    return labels, lines, header_string

def indent(l = 2):
    global indent_level
    indent_level += l
def unindent(l = 2):
    global indent_level
    indent_level -= l
def indented(s: str) -> str:
    return ' ' * indent_level + s
def write(s: str = ''):
    global res
    res += s + '\n'
def write_indented(s: str = ''):
    write(indented(s))

def handle_file(filename: str, output_filepath: str):
    global indent_level
    global res
    global global_time
    global time_field
    indent_level = 0
    res = ''
    global_time = 1
    time_field = False

    module_name = path.basename(filename).removesuffix('.cmp')

    labels, lines, header_string = read_cmp_file(filename)
    write_indented(f'module {module_name}_test;')
    indent()
    write(Label.defs(labels))
    write_indented(f'student_{module_name} dut ({', '.join(f'.{l.name}({l.name})' for l in labels)});\n')

    write_indented('initial begin')
    indent()
    write_indented(f'$display("{header_string}");\n')

    for line in lines:
        for (i, l) in filter(lambda t: t[1].is_input(), enumerate(labels)):
            write_indented(l.assign(line[i + time_field]))

        if time_field:
            if match('\\d+\\+', line[0]):
                time = int(line[0].removesuffix('+'))
                t_str = '|' + str(time) + '+'
                display(labels, time, t_str)
            else:
                display(labels, int(line[0]), '|' + line[0])
        else:
            display(labels)
        write()

    write_indented('$finish;')
    unindent()
    write_indented('end')
    unindent()
    write_indented('endmodule')

    if path.isdir(output_filepath):
        output_filepath = path.join(output_filepath, f'{module_name}_test.v')
    with open(output_filepath, 'w') as f:
        f.write(res)

if __name__ == '__main__':
    if len(argv[1:]) == 1:
        handle_file(argv[1], '/dev/stdout')
    for filepath in argv[1:-1]:
        filename = path.basename(filepath)
        print('=======', filename, '=======')
        handle_file(filepath, argv[-1])
