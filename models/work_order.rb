def all_work_orders
    run_sql("SELECT * FROM work_orders ORDER BY id")
end

# Client enquiring about job
def create_work_order(name, description, image_url)
    run_sql("INSERT INTO work_orders(name, description, image_url, job_status) VALUES($1, $2, $3, 'waiting')", [name, description, image_url])
end

def get_work_order(id)
    run_sql("SELECT * FROM work_orders WHERE id = $1", [id])[0]
end

def update_work_order(id, name, image_url)
    run_sql("UPDATE work_orders SET name = $2, image_url = $3 WHERE id = $1", [id, name, image_url])
end

def delete_work_order(id)
    run_sql("DELETE FROM work_orders WHERE id = $1", [id])
end