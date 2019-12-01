Container.boot(:logger) do |container|
  start do
    SemanticLogger.application = 'stasi-bot'
    SemanticLogger.add_appender(io: STDOUT)

    container.register(:logger, SemanticLogger['stasi-bot'])
  end
end
