
/* Dos tipos basicos de señales:
	-wire -> cables fisicos que interconectan componentes.
	-reg  -> para almacenar valores, tienen memoria.

   Cuando se declaran modulos, sus componentes input/output pueden indicarse como wire o reg.
   Si no se pone nada es tipo wire. Los wires se usan con la sentencia assign.
   Los regs en los procedimientos (ver más adelante).

   Pueden hacerse arrays para las inputs/outputs

   module ejemplo (
	input wire [3:0] a,
	input [3:0] b,
	output o1,o2
   );
   endmodule

   Los numeros "literals" se pueden expresar de varias formas
	- binario: 8'b00101010
	- octal: 8'o052
	- hexa: 8'h2A
	- decimal: 8'd42 o 42
   El primer numero indica la cantidad de bits que posee el numero.
   Luego del ' va un indicador de la base. Esto puede omitirse en el caso de decimal.

   Sentencia assign
	Todos los assigns se ejecutan concurrentemente, y se realizan sobre wires.
	assign f = x & y;

   Sentencia always
	se ejecutan concurrentemente con los demas always y assign.
	estos poseen una lista de sensibilidad. el bloque se ejecuta cuando alguna de
	las señales de la lista cambia.
	always @ (a,b)
		c = a | b;

	Si el bloque always contiene mas de una sentencia se deben agrupar usando begin y end
	always @ (a,b)
		begin
			f1 = a | b;
			f2 = c & d;
		end
	
	Cuando se describe un componente combinacional, se deben incluir en la lista
	todas las entradas del componente. Puede hacerse listando todas las señales o simplemente como
	always @ (*)
		begin
			...
		end
	Las asignaciones realizadas en un "always" deben ser sobre un reg.
	
   Operadores (bitwise)
	- AND  -> &
	- OR   -> |
	- XOR  -> ^
	- NOT  -> ~
	- NAND -> ~&
	- NOR  -> ~|
	- XNOR -> ~^

   Comparadores
	- MAYOR  		-> >
	- MAYOR O IGUAL -> >=
	- MENOR  		-> <
	- MENOR O IGUAL -> <=
	- IGUAL 		-> ==
	- DISTINTO 		-> !=
   
   Operadores Logicos
	- A y B TRUE -> &&
	- A o B TRUE -> ||
	- A FALSE	 -> ! 1 si a es falso 0 si es verdadero

   Operadores aritmeticos
	- SUMA	-> +
	- RESTA -> -
	- MULT	-> *
	- DIV	-> /

   Operadores adicionales
    - LEFT SHIFT  							-> <<
	- RIGHT SHIFT 							-> >>
	- IF sel TRUE, THEN c=a ELSE c=b 		-> c = sel ? a:b
	- ASIGNAR PALABRA A BITS INDIVIDUALES 	-> {a,b,c} = 3'b101 (a=1, b=0, c=1)

   Condicionales
	- IF, ELSE, ELSE IF -> Solo se pueden usar en procedimientos always.
		if (a>0)
			sentencia
		else if(a<0)
			sentencia2
		else
			sentencia3
	
	- CASE -> tambien dentro de always. para casos no enumerados puede usarse la palabra default.
		case(x)
			0: sentencia1;
			1: sentencia2;
			2: sentencia3;
			3: sentencia4;
		endcase

	Tanto para IF como CASE aplica lo mencionado de begin y end para multiples sentencias.
*/

/* 
	Dentro de un modulo se pueden definir constantes usando PARAMETER
	El operador de concatenacion se usa para agrupar señales como si fuesen un array.

	input a,b,c;

	always @ (*)
		case ((a,b,c)) // trata a a,b,c como un array
			3'b011: sentencia;
			default: sentencia;
		endcase

   Deteccion de flanco
	Si queremos que un proceso se ejecute en el flanco de un reloj o señales de entrada.
	Rising edge  -> posedge
	Falling edge -> negedge

	always @ (posedge clk)

   Asignacion bloqueante (=)
	Se usa si deseamos que en un proceso, la salida cambie inmediatamente.
	Modela una salida combinacional. Las acciones en un proceso se ejecutan secuencialmente.

   Asignacion no bloqueante (<=)
	Modela las estructuras en flip-flops.
	Se calculan primero los valores de la derecha de la asignacion
	de TODAS las asignaciones <= y luego se asignan todas simultaneamente.
	No importa el orden en que son escritas (no secuencial)
*/	