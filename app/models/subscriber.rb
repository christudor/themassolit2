class Subscriber < ActiveRecord::Base
  resourcify
  rolify :role_cname => 'Profile'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_DOMAINS = %w[
    
    alleyns.org.uk
    beal.redbridge.sch.uk
    caterhamschool.co.uk
    dulwich.org.uk
    godolphinandlatymer.com
    kcs.org.uk
    saintolaves.net
    stmaryleboneschool.com

    ardingly.com
    bryanston.co.uk
    kes.hants.sch.uk
    mcsoxford.org
    sevenoaksschool.org
    tonbridge-school.org
    westminster.org.uk
    wincoll.ac.uk

    ed.ac.uk
    kent.ac.uk
    newcastle.ac.uk
    ox.ac.uk
    cam.ac.uk
    kcl.ox.ac.uk
    open.ac.uk
    ucl.ac.uk
    warwick.ac.uk

    massolit.co.uk
  ]

  VALID_EMAIL_REGEXP = Regexp.new('(?:' + VALID_DOMAINS.collect { |d| Regexp.escape(d) }.join('|') + ')$')

  #validates :email,
  #  :format => {
  #    :with => VALID_EMAIL_REGEXP,
  #    :message => "Is this your school e-mail address?"
  #  }

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :current_password, :remember_me, :job, :school_id, :sex, :date_of_birth, :role_ids
  before_create :assign_role

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false

  belongs_to :school
  has_many :relationships, foreign_key: "student_id"
  has_many :studied_courses, through: :relationships, source: :course
  has_many :scores
  has_many :quizzes, :through => :scores

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :invalidstudent
  end

end
