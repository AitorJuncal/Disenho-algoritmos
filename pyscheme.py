# Desafío: ¿Puedes implementar un intérprete de esquemas en
#Python que sea capaz de ejecutar el siguiente procedimiento?

# Una definición de procedimiento para: (definir hecho (lambda (n) (si
#(= n 1) 1 (* n (hecho (- n 1)))))) Se representa en Python usando la
#siguiente tupla:

fact = ('define', 'fact', 
        ('lambda', ('n',), ('if', ('=', 'n', 1),
                            1,
                            ('*', 'n', ('fact', ('-', 'n', 1))))))
def temp(x,y): 
    global ambito
    ambito[x]=seval(y)

def iff(x,y,z):
    if seval(x):
        return seval(y)
    else:
        return seval(z)



def lambda_aux(argumentos, codigo):
    def tmp(*args):
        global ambito
        for i,j in zip(argumentos,args):
            ambito[i] = seval(j)
        return seval(codigo)
    return tmp
    
ambito = {
    '+' : lambda x,y: seval(x)+seval(y),
    '*' : lambda x,y: seval(x)*seval(y),
    '-' : lambda x,y: seval(x)-seval(y),
    '/' : lambda x,y: seval(x)/seval(y),
    '=' : lambda x,y: seval(x)==seval(y),
    'define': temp,
    'if': iff,
    'lambda': lambda_aux
    
    }

# Lo único que es necesario evaluar es la siguiente expresión.
def seval(sexp):
    if isinstance(sexp, int):
        return sexp
    elif isinstance(sexp, str):
        if sexp in ambito:
            return ambito[sexp]
        return sexp
    elif isinstance(sexp,tuple):
        #print(sexp)
      
        return ambito[sexp [0]](*sexp[1:])

# Al escribir seval, SOLO se le permite usar las reglas de Scheme
# evaluación que conoce actualmente. Hasta ahora, esto incluye la
# modelo de sustitución y la noción de formas especiales.

""""If y lambda no son aplicativas, hay que evaluar todas las variables usando "seval" por separado"""

# Some basic tests
assert seval(42) == 42
assert seval(('+', 2, 3)) == 5
seval(('define', 'n', 5))
assert seval('n') == 5
assert seval(('-', 2, 3)) == -1
assert seval(('*', 2, 3)) == 6
assert seval(('/', 3, 3)) == 1

# El último test consiste en evaluar la definición de factorial
seval(fact)
assert seval(('fact', 'n')) == 120
