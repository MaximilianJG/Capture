class AddUrlOfQuoteToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :url_of_quote, :string
  end
end
