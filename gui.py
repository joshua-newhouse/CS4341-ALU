from flask import Flask, render_template, request
from jinja2 import Template
from subprocess import check_output

app = Flask(__name__)

def gen_dict(x, y, op):
    template_dict = {}
    template_dict['x'] = x
    template_dict['y'] = y
    template_dict['sub'] = 0
    template_dict['inv'] = 0
    if op == 'ADD':
        template_dict['opcode'] = '00001'
    elif op == 'SUB':
        template_dict['opcode'] = '00001'
        template_dict['sub'] = 1
    elif op == 'MULT':
        template_dict['opcode'] = '00010'
    elif op == 'AND':
        template_dict['opcode'] = '00100'
    elif op == 'OR':
        template_dict['opcode'] = '01000'
    elif op == 'XOR':
        template_dict['opcode'] = '10000'
    elif op == 'NOT':
        template_dict['opcode'] = '10000'
        template_dict['inv'] = 1
    return template_dict

def template_verilog(x, y, op, template_name, out_name):
    template_dict = gen_dict(x, y, op)
    with open(template_name) as template_file:
        verilog_template = Template(template_file.read())
        with open(out_name, 'w') as output_file:
            output_file.write(verilog_template.render(template_dict))

def run_verilog(out_name, exec_name):
    check_output(['iverilog', '-o', exec_name, out_name])
    output = check_output(['./{}'.format(exec_name)]).decode('ASCII').strip().split(';')[-2]
    overflow, negative, value = [int(val) for val in output.split(',')]
    if overflow == 1:
        output = 'OVERFLOW'
    else:
        if negative == 1:
            output = value - 65536
        else:
            output = value
    check_output(['rm', out_name, exec_name])
    return output

def calculate(x, y, op):
    template_verilog(x, y, op, 'gui.v.j2', 'gui_temp.v')
    return run_verilog('gui_temp.v', 'gui_temp')

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return render_template('index.html.j2', result=calculate(request.form['x'], request.form['y'], request.form['op']))
    else:
        return render_template('index.html.j2')


if __name__ == '__main__':
    app.run(host='0.0.0.0')
