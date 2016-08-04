if User.all.empty?
  service = Admins::UserCreator.new(
    email: Rails.application.secrets.admin_email,
    password: Rails.application.secrets.admin_password,
    admin: true)

  service.run!

  puts "CREATED ADMIN USER: " << service.record.email
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
