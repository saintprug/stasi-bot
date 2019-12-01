Container.boot(:dotenv) do |app|
  start do
    Dotenv.load(app.root.join(".env.#{ENV['STASI_BOT_ENV']}")) if defined?(Dotenv)
  end
end
