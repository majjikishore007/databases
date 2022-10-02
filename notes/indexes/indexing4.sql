##
create table 
student(
    id serial not null,
    name text not null,
    grade int ,
)

## creating an index 
create index s_idx on student(id)


## adding a non-key coulum

create index g_ind on student(id) include(name)



