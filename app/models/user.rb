class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  extend FriendlyId
  friendly_id :username, use: :slugged

  after_validation :validate_reserved
  def validate_reserved
    if @errors[:friendly_id].present?
      @errors[:username] = "is reserved. Please choose something else"
      @errors.messages.delete(:friendly_id)
    end
  end

  has_many :pins, dependent: :destroy
  has_attached_file :avatar, styles: { show: "600x600>", medium: "300x300>", thumb: "100x100>", mini: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :properties

  acts_as_voter

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: true
  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }

  attr_accessor :login

  def full_name
    self.first_name << " " << self.last_name
  end
  def full_name=(first_name)
    names = first_name.split(/(.+) (.+)$/)
    self.first_name = names[0]  
    self.last_name = names[1] 
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
      	conditions[:email].downcase! if conditions[:email]
        where(conditions.to_hash).first
      end
  end

end
