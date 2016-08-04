if User.all.empty?
  user = Admins::UserCreator(
    email: Rails.application.secrets.admin_email,
    password: Rails.application.secrets.admin_password,
    admin: true)

  puts "CREATED ADMIN USER: " << user.email
end

Category.create([
                  { title: "Design" },
                  { title: "Desenvolvimento" },
                  { title: "Social Media" },
                  { title: "Marketing" },
                  { title: "Business/Executivo" },
                  { title: "Relacionamento com o cliente" },
                  { title: "Suporte" },
                  { title: "Operações" },
                  { title: "Comercial" },
                  { title: "Audiovisual e Fotografia" },
                  { title: "Diversos" }
                ]) if Category.all.count == 0

JobType.create([
                 { title: "Full-time" },
                 { title: "Freelancer" },
                 { title: "Estágio" },
                 { title: "Remoto" }
               ]) if JobType.all.count == 0
