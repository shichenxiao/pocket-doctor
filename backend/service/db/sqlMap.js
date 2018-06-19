var sqlMap = {
    user: {
        add: 'insert into person(username, account, password, repeatPass, email, phone, card, birth, sex) values (?,?,?,?,?,?,?,?,?)',
        select_name: 'select * from person', 
        update_user: 'update person set'
    },
    people:{
        select_ID: 'select * from patient', 
        update_user: 'update user patient'
    }
}

module.exports = sqlMap;