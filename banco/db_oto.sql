create extension if not exists pg_argon2;
create extension if not exists pgcrypto;

-----------------------------------------------------------
create table convenio(
id serial primary key,
nome varchar(100) not null,
status varchar(10) not null
);

create table servico (
id serial primary key,
nome_procedimento varchar(100) not null,
descricao text,
duracao time,
valor decimal(10,2),
status varchar(10)
);

create table especialidade (
id uuid primary key default gen_random_uuid(),
nome_especialidade varchar(100) unique not null
);

create table endereco (
id serial primary key,
estado char(2) not null,
cidade varchar(100) not null,
bairro varchar(100) not null,
rua varchar(100) not null,
cep varchar(8) not null,
numero_casa varchar(10) not null
);

--------------------------------------------------------

create table usuario (
id uuid primary key default gen_random_uuid(),
nome varchar(100) not null,
email varchar(100) unique not null,
senha_hash varchar(300) not null,
telefone varchar(11) not null,
cpf varchar(11) unique not null,
id_endereco int not null,
foreign key (id_endereco) references endereco(id)
);

create table medico(
id uuid primary key default gen_random_uuid(),
nome varchar(100) not null,
id_especialidade uuid not null,
foreign key (id_especialidade) references especialidade(id),
crm varchar(10) unique not null,
rqe varchar(10)
);

create table agenda_medica (
id uuid primary key default gen_random_uuid(),
id_medico uuid not null,
foreign key (id_medico) references medico(id),
dia_semana int check(dia_semana between 0 and 6) not null,
hora_inicio time not null,
hora_fim time not null,
duracao_slot_minutos int not null,
unique(id_medico,dia_semana,hora_inicio)
);

create table recepcionista(
id uuid primary key default gen_random_uuid(),
nome varchar(100) not null,
email varchar(100) unique not null,
telefone varchar(11) not null,
permissoes_admin boolean default(false),
senha_hash varchar(300) not null
);

create table consultas(
id serial primary key,
id_recepcionista uuid,
foreign key (id_recepcionista) references recepcionista(id),
id_usuario uuid not null,
foreign key (id_usuario) references usuario(id),
id_medico uuid not null,
foreign key (id_medico) references medico(id),
id_convenio int,
foreign key (id_convenio) references convenio(id),
id_servico int not null,
foreign key (id_servico) references servico(id),
data_hora timestamptz not null,
status varchar(20) not null default 'agendada'
);

--------------------------------------------------------
--begin;
--rollback;
--commit;