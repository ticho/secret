User.destroy_all

User.create(
  email: 'super_email@host.com',
  password: 'supersecurepw',
  password_confirmation: 'supersecurepw'
)

User.create(
  email: 'tib@host.com',
  password: 'qwerty',
  password_confirmation: 'qwerty'
)