# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121106200535) do

  create_table "cliente", :id => false, :force => true do |t|
    t.string  "email",          :limit => 40
    t.string  "usuario",        :limit => 20
    t.string  "senha",          :limit => 12
    t.integer "fkcodpessoa",                  :null => false
    t.string  "remember_token"
  end

  add_index "cliente", ["remember_token"], :name => "index_cliente_on_remember_token"

  create_table "codigocontabil", :primary_key => "codcontabil", :force => true do |t|
    t.string "nome", :limit => 30, :null => false
  end

  create_table "composicao_produto", :id => false, :force => true do |t|
    t.integer "fkcodprodfinal",  :null => false
    t.integer "fkcodprodingred", :null => false
  end

  create_table "compra", :primary_key => "codcompra", :force => true do |t|
    t.string  "titulo",      :limit => 50, :null => false
    t.date    "datavenc",                  :null => false
    t.integer "fkcodfornec"
  end

  create_table "conta_pagar", :primary_key => "codcontapagar", :force => true do |t|
    t.date    "datapag"
    t.date    "dataentrada",                 :null => false
    t.string  "status",        :limit => 20, :null => false
    t.integer "fkcodcompra"
    t.integer "fkcodcontabil"
    t.integer "fkcoddespesa"
  end

  create_table "conta_receber", :primary_key => "codcontarec", :force => true do |t|
    t.integer "fkcodpedido"
  end

  create_table "despesageral", :primary_key => "coddespesa", :force => true do |t|
    t.string "titulo",   :limit => 30, :null => false
    t.float  "valor",                  :null => false
    t.date   "datavenc",               :null => false
  end

  create_table "endereco", :id => false, :force => true do |t|
    t.string  "logradouro",  :limit => 50,  :null => false
    t.integer "numero",                     :null => false
    t.string  "complemento", :limit => 30
    t.string  "comentario",  :limit => 150
    t.integer "fkcodpessoa",                :null => false
  end

  create_table "formapag", :primary_key => "codformapag", :force => true do |t|
    t.string "formapag", :limit => 20, :null => false
  end

  create_table "fornecedor", :id => false, :force => true do |t|
    t.string  "cnpj",        :limit => 20
    t.integer "fkcodpessoa",               :null => false
  end

  create_table "funcionario", :id => false, :force => true do |t|
    t.date    "datanasc",                   :null => false
    t.date    "dataadmissao",               :null => false
    t.float   "salario",                    :null => false
    t.string  "cargo",        :limit => 15, :null => false
    t.integer "fkcodpessoa",                :null => false
  end

  create_table "item", :primary_key => "coditem", :force => true do |t|
    t.string  "comentario",  :limit => 150
    t.float   "precovenda",                 :null => false
    t.float   "precoadd",                   :null => false
    t.string  "borda",       :limit => 15
    t.integer "quantidade",                 :null => false
    t.integer "fkcodpedido"
  end

  create_table "item_produto", :id => false, :force => true do |t|
    t.string  "porcao",    :limit => 5, :null => false
    t.integer "fkcodprod"
    t.integer "fkcoditem"
  end

  create_table "pedido", :primary_key => "codpedido", :force => true do |t|
    t.float   "troco",                       :null => false
    t.float   "frete",                       :null => false
    t.float   "valor",                       :null => false
    t.date    "data",                        :null => false
    t.string  "status",        :limit => 15, :null => false
    t.integer "fkcodcliente"
    t.integer "fkcodfunc"
    t.integer "fkcodformapag"
  end

  create_table "pessoa", :primary_key => "codpessoa", :force => true do |t|
    t.string "nome", :limit => 50, :null => false
    t.string "tipo", :limit => 40, :null => false
  end

  create_table "produto", :primary_key => "codprod", :force => true do |t|
    t.string  "nome",          :limit => 15, :null => false
    t.float   "precovenda",                  :null => false
    t.integer "quant",                       :null => false
    t.integer "fkcodtipoprod"
  end

  add_index "produto", ["nome", "fkcodtipoprod"], :name => "produto_nome_fkcodtipoprod_key", :unique => true

  create_table "produto_compra", :id => false, :force => true do |t|
    t.float   "precounit",   :null => false
    t.integer "quant",       :null => false
    t.integer "fkcodprod"
    t.integer "fkcodcompra"
  end

  create_table "produto_oferecido", :id => false, :force => true do |t|
    t.float   "preco",       :null => false
    t.integer "fkcodprod"
    t.integer "fkcodfornec"
  end

  create_table "telefone", :id => false, :force => true do |t|
    t.string  "numero",      :limit => 9, :null => false
    t.integer "fkcodpessoa"
  end

  create_table "tipoprod", :primary_key => "codtipoprod", :force => true do |t|
    t.string "tipoprod", :limit => 15, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
