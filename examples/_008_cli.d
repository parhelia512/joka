/// This example shows how to use Joka's command-line parsing utilities.

import joka;

void main(string[] args) {
    println("Arguments:");
    if (args.length == 1) println(" None");
    foreach (token; ArgRange(args[1 .. $])) {
        with (ArgType) final switch (token.type) {
            case singleItem:  println(" Single Item: ", token.name); break;
            case shortOption: println(" Short Option: ", token.name); break;
            case longOption:  println(" Long Option: ", token.name); break;
        }
    }
    println();
}
