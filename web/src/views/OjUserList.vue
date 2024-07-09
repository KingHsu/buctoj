<template>
  <div>
      <div style="margin-bottom: 5px;">
          <el-input v-model="stuNum" placeholder="请输入学号" suffix-icon="el-icon-search" style="width: 200px;"
                    @keyup.enter.native="loadPost"></el-input>
          <el-select v-model="sex" filterable placeholder="请选择性别" style="margin-left: 5px;">
              <el-option
                      v-for="item in sexs"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value">
              </el-option>
          </el-select>
          <el-button type="primary" style="margin-left: 5px;" @click="loadPost">查询</el-button>
          <el-button type="success" @click="resetParam">重置</el-button>

      </div>
      <el-table
      :data="tableData"
      style="width: 100%">
        <el-table-column
        prop="stuNo"
        label="ID"
        width="180">
        </el-table-column>
        <el-table-column
            prop="stuName"
            label="姓名"
            width="180">
        </el-table-column>
        <el-table-column
            prop="stuClass"
            label="班级">
        </el-table-column>
        <el-table-column
            prop="stuUsername"
            label="用户名">
        </el-table-column>
        <el-table-column
            prop="stuNum"
            label="学号">
        </el-table-column>
    </el-table>
      <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[5, 10, 20,30]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
      </el-pagination>

      <el-dialog
              title="提示"
              :visible.sync="centerDialogVisible"
              width="30%"
              center>

          <el-form ref="form" :rules="rules" :model="form" label-width="80px">
              <el-form-item label="账号" prop="no">
                  <el-col :span="20">
                      <el-input v-model="form.no"></el-input>
                  </el-col>
              </el-form-item>
              <el-form-item label="名字" prop="name">
                  <el-col :span="20">
                      <el-input v-model="form.name"></el-input>
                  </el-col>
              </el-form-item>
              <el-form-item label="密码" prop="password">
                  <el-col :span="20">
                      <el-input v-model="form.password"></el-input>
                  </el-col>
              </el-form-item>
              <el-form-item label="年龄" prop="age">
                  <el-col :span="20">
                      <el-input v-model="form.age"></el-input>
                  </el-col>
              </el-form-item>
              <el-form-item label="性别">
                  <el-radio-group v-model="form.sex">
                      <el-radio label="1">男</el-radio>
                      <el-radio label="0">女</el-radio>
                  </el-radio-group>
              </el-form-item>
              <el-form-item label="电话" prop="phone">
                  <el-col :span="20">
                      <el-input v-model="form.phone"></el-input>
                  </el-col>
              </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
  <el-button @click="centerDialogVisible = false">取 消</el-button>
  <el-button type="primary" @click="save">确 定</el-button>
</span>
      </el-dialog>
  </div>
</template>

<script>
  export default {
      name: "OjUserList",
      data() {
        //   let checkAge = (rule, value, callback) => {
        //       if(value>150){
        //           callback(new Error('年龄输入过大'));
        //       }else{
        //           callback();
        //       }
        //   };
        //   let checkDuplicate =(rule,value,callback)=>{
        //       if(this.form.id){
        //           return callback();
        //       }
        //       this.$axios.get(this.$httpUrl+"/student/findByNo?no="+this.form.no).then(res=>res.data).then(res=>{
        //           if(res.code!=200){

        //               callback()
        //           }else{
        //               callback(new Error('账号已经存在'));
        //           }
        //       })
        //   };

          return {
              tableData: [],
              pageSize:10,
              pageNum:1,
              total:0,
              stuNum:'',
              sexs:[
                  {
                      value: '1',
                      label: '男'
                  }, {
                      value: '0',
                      label: '女'
                  }
              ],
              centerDialogVisible:false,
              form:{
                  stuNo:'',
                  stuName:'',
                  stuClass:'',
                  stuUsername:''
              },
            //   rules: {
            //       no: [
            //           {required: true, message: '请输入账号', trigger: 'blur'},
            //           {min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur'},
            //           {validator:checkDuplicate,trigger: 'blur'}
            //       ],
            //       name: [
            //           {required: true, message: '请输入名字', trigger: 'blur'}
            //       ],
            //       password: [
            //           {required: true, message: '请输入密码', trigger: 'blur'},
            //           {min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur'}
            //       ],
            //       age: [
            //           {required: true, message: '请输入年龄', trigger: 'blur'},
            //           {min: 1, max: 3, message: '长度在 1 到 3 个位', trigger: 'blur'},
            //           {pattern: /^([1-9][0-9]*){1,3}$/,message: '年龄必须为正整数字',trigger: "blur"},
            //           {validator:checkAge,trigger: 'blur'}
            //       ],
            //       phone: [
            //           {required: true,message: "手机号不能为空",trigger: "blur"},
            //           {pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur"}
            //       ]
            //   }
          }
      },
      methods:{
          resetForm() {
              this.$refs.form.resetFields();
          },
          del(id){
              console.log(id)

              this.$axios.get(this.$httpUrl+'/student/del?id='+id).then(res=>res.data).then(res=>{
                  console.log(res)
                  if(res.code==200){

                      this.$message({
                          message: '操作成功！',
                          type: 'success'
                      });
                      this.loadPost()
                  }else{
                      this.$message({
                          message: '操作失败！',
                          type: 'error'
                      });
                  }

              })
          },
          mod(row){
              console.log(row)

              this.centerDialogVisible = true
              this.$nextTick(()=>{
                  //赋值到表单
                  this.form.id = row.id
                  this.form.no = row.no
                  this.form.name = row.name
                  this.form.password = ''
                  this.form.age = row.age +''
                  this.form.sex = row.sex +''
                  this.form.phone = row.phone
                  this.form.roleId = row.roleId
              })
          },
          add(){

              this.centerDialogVisible = true
              this.$nextTick(()=>{
                  this.resetForm()
              })

          },
          doSave(){
              this.$axios.post(this.$httpUrl+'/student/save',this.form).then(res=>res.data).then(res=>{
                  console.log(res)
                  if(res.code==200){

                      this.$message({
                          message: '操作成功！',
                          type: 'success'
                      });
                      this.centerDialogVisible = false
                      this.loadPost()
                      this. resetForm()
                  }else{
                      this.$message({
                          message: '操作失败！',
                          type: 'error'
                      });
                  }

              })
          },
          doMod(){
              this.$axios.post(this.$httpUrl+'/student/update',this.form).then(res=>res.data).then(res=>{
                  console.log(res)
                  if(res.code==200){

                      this.$message({
                          message: '操作成功！',
                          type: 'success'
                      });
                      this.centerDialogVisible = false
                      this.loadPost()
                      this. resetForm()
                  }else{
                      this.$message({
                          message: '操作失败！',
                          type: 'error'
                      });
                  }

              })
          },
          save(){
              this.$refs.form.validate((valid) => {
                  if (valid) {
                      if(this.form.id){
                          this.doMod();
                      }else{
                          this.doSave();
                      }
                  } else {
                      console.log('error submit!!');
                      return false;
                  }
              });

          },
          handleSizeChange(val) {
              console.log(`每页 ${val} 条`);
              this.pageNum=1
              this.pageSize=val
              this.loadPost()
          },
          handleCurrentChange(val) {
              console.log(`当前页: ${val}`);
              this.pageNum=val
              this.loadPost()
          },
          loadGet(){
              this.$axios.get(this.$httpUrl+'/student/list').then(res=>res.data).then(res=>{
                  console.log(res)
              })
          },
          resetParam(){
              this.name=''
              this.sex=''
          },
          selectCurrentChange(val) {
              //this.currentRow = val;
              this.$emit("doSelectUser",val)
          },
          loadPost(){
              this.$axios.post(this.$httpUrl+'/student/listPage',{
                  pageSize:this.pageSize,
                  pageNum:this.pageNum,
                  param:{
                      stuNum: this.stuNum,
                  }
              }).then(res=>res.data).then(res=>{
                  console.log(res)
                  if(res.code==200){
                      this.tableData=res.data
                      this.total=res.total
                  }else{
                      alert('获取数据失败')
                  }

              })
          }
      },
      beforeMount() {
          //this.loadGet();
          this.loadPost()
      }
  }
</script>

<style scoped>

</style>