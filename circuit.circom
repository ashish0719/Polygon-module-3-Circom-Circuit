pragma circom 2.0.0;

/*This circuit template performs logical AND, NOT, and OR operations on A and B.*/  

template MyCircomCircuit () {  

   // signal inputs
   signal input A;
   signal input B;

   // intermediate signals from gates
   signal X;
   signal Y;

   // final signal output (result of OR gate)
   signal output Q;

   // component gates used to create the circuit  
   component LogicAnd = AND();
   component LogicNot = NOT();
   component LogicOr = OR();

   // circuit logic
   LogicAnd.a <== A;
   LogicAnd.b <== B;
   X <== LogicAnd.out; // X is result of AND(A, B)

   LogicNot.in <== B;
   Y <== LogicNot.out; // Y is result of NOT(B)

   LogicOr.a <== X;
   LogicOr.b <== Y;
   Q <== LogicOr.out;  // Q is result of OR(X, Y)
}

//---------------------templates for the logic gates------------

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b; // AND is multiplication
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b; // OR logic
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in; // NOT logic
}

// Main circuit component instantiation
component main = MyCircomCircuit();
