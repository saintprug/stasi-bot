RSpec.describe 'Listener' do
  include Import[
    listener: 'services.telegram.listener'
  ]

  let(:status) { 200 }
  let(:headers) do
    {'Content-Type' => 'application/json'}
  end

  before do
    stub_request(:get, "https://api.telegram.org/token/getUpdates?offset").
      with(
        headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/json',
       	  'User-Agent'=>'Faraday v0.17.1'
        }).
      to_return(status: status, body: body.to_json, headers: headers)
  end

  context 'updates exists' do
    let(:body) do
      {
        'ok' => true,
        'result' => [{
          'update_id' => 119993464,
          'message' => {
            'message_id' => 16,
            'from' => {
              'id' => 173949199, 'is_bot' => false, 'first_name' => 'Whatever',
              'username' => 'Whatever', 'language_code' => 'en'
            },
            'chat' => {
              'id' => 173839199, 'first_name' => 'Whatever', 'username' => 'Whatever', 'type' => 'private'
            },
            'date' => 1575201750,
            'text' => 'test'
          }
        }]
      }
    end

    it 'updates contains in list' do
      result = listener.fetch_updates

      expect(result.count).to eq 1
      expect(result).to be_an(Array)
      expect(result.first).to be_an(Entities::Telegram::Update)
    end
  end

  context 'updates does not exist' do
    let(:body) do
      {
        'ok' => true,
        'result' => []
      }
    end
    it 'updates does not contain in list' do
      result = listener.fetch_updates

      expect(result.count).to eq 0
      expect(result).to be_an(Array)
    end
  end
end
