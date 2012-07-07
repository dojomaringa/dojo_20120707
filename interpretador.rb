class Interpretador
  def self.avalia(expressao)
    tokens = tokens(expressao)
    @operador = tokens.shift

    Interpretador.send(@operador, tokens).to_s
  end

  def self.tokens(expressao)
    expressao =~ /\((.*)\)/
    $1.split
  end

  def self.>(operandos)
    operandos.first > operandos.last
  end

  def self.==(operandos)
    operandos.first == operandos.last
  end

  def self.+(operandos)
    operandos.map { |operando| operando.to_i }.reduce(:+)
  end
end