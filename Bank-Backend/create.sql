create table bank_account_seq (next_val bigint) engine=InnoDB;
insert into bank_account_seq values ( 1 );
create table bank_account (balance float(53) not null, enabled bit not null, id bigint not null, user_id bigint, name varchar(255) not null, primary key (id)) engine=InnoDB;
create table commentary (id bigint not null, transaction_id bigint not null, writer_id bigint, commentary varchar(255) not null, primary key (id)) engine=InnoDB;
create table commentary_seq (next_val bigint) engine=InnoDB;
insert into commentary_seq values ( 1 );
create table privilege (id bigint not null, name varchar(255), primary key (id)) engine=InnoDB;
create table privilege_seq (next_val bigint) engine=InnoDB;
insert into privilege_seq values ( 1 );
create table role (id bigint not null, name varchar(255), primary key (id)) engine=InnoDB;
create table role_seq (next_val bigint) engine=InnoDB;
insert into role_seq values ( 1 );
create table roles_privileges (privilege_id bigint not null, role_id bigint not null) engine=InnoDB;
create table transaction (balance float(53) not null, id bigint not null, receiver_id bigint, sender_id bigint, primary key (id)) engine=InnoDB;
create table transaction_seq (next_val bigint) engine=InnoDB;
insert into transaction_seq values ( 1 );
create table user (balance float(53) not null, enabled bit not null, phone_number integer not null, token_expired bit not null, birth_date datetime(6) not null, id bigint not null, address varchar(255), document_id varchar(255) not null, email varchar(255) not null, first_name varchar(255) not null, last_name varchar(255) not null, password varchar(255) not null, username varchar(255) not null, primary key (id)) engine=InnoDB;
create table user_friends (friends_id bigint not null, user_id bigint not null) engine=InnoDB;
create table user_seq (next_val bigint) engine=InnoDB;
insert into user_seq values ( 1 );
create table users_likes (transaction_id bigint not null, user_id bigint not null, primary key (transaction_id, user_id)) engine=InnoDB;
create table users_roles (role_id bigint not null, user_id bigint not null, primary key (role_id, user_id)) engine=InnoDB;
alter table bank_account add constraint UK_46ei8asi892mmp6wl7gv4nv56 unique (name);
alter table user add constraint UK_g785r7p779qkp1d6hprbi9h82 unique (document_id);
alter table user add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
alter table user add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (username);
alter table bank_account add constraint FK92iik4jwhk7q385jubl2bc2mm foreign key (user_id) references user (id);
alter table commentary add constraint FK3y0ubjo52qwewmcb4tvtlkgic foreign key (transaction_id) references transaction (id);
alter table commentary add constraint FKplvykpp27t5jw7b220b6kgttb foreign key (writer_id) references user (id);
alter table roles_privileges add constraint FK5yjwxw2gvfyu76j3rgqwo685u foreign key (privilege_id) references privilege (id);
alter table roles_privileges add constraint FK9h2vewsqh8luhfq71xokh4who foreign key (role_id) references role (id);
alter table transaction add constraint FKqwbmsp7mio9tjy42ja0njc7q8 foreign key (receiver_id) references bank_account (id);
alter table transaction add constraint FKolka13i979w8vrw8mf94xmqdb foreign key (sender_id) references bank_account (id);
alter table user_friends add constraint FKe1jhkryq5denjdrjngi7lj9h4 foreign key (friends_id) references user (id);
alter table user_friends add constraint FK9i7cldnk7cx2g47qex8ovm2ah foreign key (user_id) references user (id);
alter table users_likes add constraint FK4dyvk9fyq9qvqogxj0i2vj17f foreign key (user_id) references user (id);
alter table users_likes add constraint FKg34qpjiq82l8bqj2puedmhhkn foreign key (transaction_id) references transaction (id);
alter table users_roles add constraint FKt4v0rrweyk393bdgt107vdx0x foreign key (role_id) references role (id);
alter table users_roles add constraint FKgd3iendaoyh04b95ykqise6qh foreign key (user_id) references user (id);
