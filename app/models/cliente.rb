class Cliente < ActiveRecord::Base
  set_table_name("cliente")
  attr_accessible :usuario , :email, :senha
  belongs_to :pessoa

  before_save { |cliente| cliente.email = email.downcase }
  before_save :create_remember_token

  validates :usuario,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :senha, presence: true, length: { minimum: 6 }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end