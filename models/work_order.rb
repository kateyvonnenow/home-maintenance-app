def all_work_orders
    run_sql("SELECT * FROM work_orders ORDER BY id")
end

def client_work_orders(session_id)
    run_sql("SELECT * FROM work_orders WHERE client_id = $1 ORDER BY id", [session_id])
end

# Client enquiring about job
def create_work_order(name, description, image_url)
    run_sql("INSERT INTO work_orders(name, description, image_url, job_status, client_id) VALUES($1, $2, $3, 'QUEUED', #{session['user_id']})", [name, description, image_url])
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

# def set_status_work_order(id, )