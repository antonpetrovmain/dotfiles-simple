# shell.nix
with import <nixpkgs> {};

mkShell {
  buildInputs = [
    openjdk17    # JDK 17 compiler/runtime
    openjdk23    # JDK 23 compiler/runtime
  ];

  shellHook = ''
    # expose separate JAVA_HOME’s
    export JAVA17_HOME=${openjdk17}
    export JAVA23_HOME=${openjdk23}

    # easy aliases to pick your version
    alias java17="$JAVA17_HOME/bin/java"
    alias javac17="$JAVA17_HOME/bin/javac"
    alias java23="$JAVA23_HOME/bin/java"
    alias javac23="$JAVA23_HOME/bin/javac"

    echo "Java 17 → $JAVA17_HOME; Java 23 → $JAVA23_HOME"
    echo "Use ‘java17’/‘javac17’ or ‘java23’/‘javac23’"
  '';
}

