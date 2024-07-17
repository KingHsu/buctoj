<template>
  <div>
    <div style=" display: flex; justify-content:space-between; margin: 0 15px">
      <div><h3>用户列表</h3></div>
      <div style="margin-bottom: 5px;">
        <el-input
          v-model="searchQuery"
          placeholder="请输入学号"
          suffix-icon="el-icon-search"
          style="width: 300px; margin-right: 10px;"
          @keyup.enter.native="loadInquire">
        </el-input>
        <el-button type="primary" @click="loadInquire">查询</el-button>
        <el-button type="success" @click="resetParam">重置</el-button>
        <el-button v-if="isUserAdmin()" type="warning" @click="TJCollectionForm">添加</el-button>
      </div>
    </div>

    <div>
      <el-table
      :data="tableData"
      style="width: 100%">
        <el-table-column
          label="ID"
          align="center"
          prop="stuNo"
          width="100">
        </el-table-column>
        <el-table-column
            prop="stuUsername"
            label="用户名"
            align="center">
        </el-table-column>
        <el-table-column
            prop="stuName"
            label="姓名"
            width="180"
            align="center">
        </el-table-column>
        <el-table-column
            prop="stuClass"
            label="班级"
            align="center">
        </el-table-column>
        <el-table-column
            prop="stuNum"
            label="学号"
            align="center">
        </el-table-column>
        <el-table-column
            prop="stuCfId"
            label="cf用户名"
            align="center">
        </el-table-column>
        <el-table-column
            prop="stuAcId"
            label="ac用户名"
            align="center">
        </el-table-column>
        <el-table-column v-if="isUserAdmin()" fixed="right" label="操作" width="120">
          <template slot-scope="scope">
            <el-tooltip class="item" effect="light" content="修改" placement="top">
              <el-button type="primary" icon="el-icon-edit" circle @click="BJCollectionForm(scope.$index)"></el-button>
            </el-tooltip>
            <el-tooltip class="item" effect="light" content="删除" placement="top">
              <el-button type="danger" icon="el-icon-delete" circle @click="deleteVisible(scope)"></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div style="text-align: center;margin:auto;">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[5, 10, 20,30]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="collectionform" :rules="rules" :model="ruleForm" label-width="120px" label-position="left">
        <el-form-item label="用户名" prop="stuUsername">
          <el-input placeholder="用户名" v-model="ruleForm.stuUsername"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="stuPassword">
          <el-input placeholder="密码" v-model="ruleForm.stuPassword"></el-input>
        </el-form-item>
        <el-form-item label="班级" prop="stuClass">
          <el-input placeholder="班级" v-model="ruleForm.stuClass"></el-input>
        </el-form-item>
        <el-form-item label="学号" prop="stuNum">
          <el-input placeholder="学号" v-model="ruleForm.stuNum"></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="stuName">
          <el-input placeholder="姓名" v-model="ruleForm.stuName"></el-input>
        </el-form-item>
        <el-form-item label="cf用户名" prop="stuCfId">
          <el-input placeholder="cf用户名" v-model="ruleForm.stuCfId"></el-input>
        </el-form-item>
        <el-form-item label="ac用户名" prop="stuAcId">
          <el-input placeholder="ac用户名" v-model="ruleForm.stuAcId"></el-input>
        </el-form-item>
        <el-form-item label="是否为管理员" prop="stuMan">
          <el-input placeholder="是否为管理员" v-model="ruleForm.stuMan"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" v-if="dialogStatus=='create'" @click="submitCollectionForm('collectionform')">添 加</el-button>
        <el-button type="warning" v-else @click="updateCollectionForm('collectionform')">修 改</el-button>
      </div>
    </el-dialog>
</div>
</template>

<script>
import { Message, MessageBox } from 'element-ui'

// import request from '@/utils/request'

export default {
  name: 'UserList',
  data () {
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
      pageSize: 10,
      pageNum: 1,
      total: 0,
      searchQuery: '',
      dialogFormVisible: false,
      dialogStatus: 'create',
      textMap: {
        update: '修改用户数据',
        create: '添加用户数据'
      },
      form: {
        stuName: '',
        stuUsername: '',
        stuClass: '',
        stuNum: '',
        stuCfId: '',
        stuAcId: '',
        stuPassword: '',
        stuNo: ''
      },
      ruleForm: {
        stuName: '',
        stuUsername: '',
        stuClass: '',
        stuNum: '',
        stuCfId: '',
        stuAcId: '',
        stuMan: '',
        stuPassword: '',
        stuNo: ''
      },
      rules: {
        no: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' }
          // { validator: checkDuplicate, trigger: 'blur' }
        ],
        name: [
          { required: true, message: '请输入名字', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' }
        ],
        age: [
          { required: true, message: '请输入年龄', trigger: 'blur' },
          { min: 1, max: 3, message: '长度在 1 到 3 个位', trigger: 'blur' },
          { pattern: /^([1-9][0-9]*){1,3}$/, message: '年龄必须为正整数字', trigger: 'blur' }
          // { validator: checkAge, trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: '请输入正确的手机号码', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    isUserAdmin () {
      // console.log(this.$store.getters['setting/getIsAdmin'])
      return this.$store.getters['setting/getIsAdmin'] === '1'
    },
    resetForm () {
      this.$refs.form.resetFields()
    },
    TJCollectionForm () {
      /* 表单重置 */
      Object.assign(this.$data.ruleForm, this.$options.data().ruleForm)

      this.dialogStatus = 'create'
      this.dialogFormVisible = true
    },
    /* 编辑表单 */
    BJCollectionForm ($index) {
      // 显示修改对话框
      this.ruleForm = JSON.parse(JSON.stringify(this.tableData[$index]))
      // 以下效果和上面的不一样
      // this.ruleForm=this.list[$index]

      this.dialogStatus = 'update'
      this.dialogFormVisible = true
    },
    submitCollectionForm (formname) {
      this.$refs[formname].validate((valid) => {
        if (valid) {
          this.$axios({
            method: 'post',
            url: this.$httpUrl + '/student',
            data: this.ruleForm
          }).then((response) => {
            if (response.data.code === 200) {
              this.loadPost()
              this.dialogFormVisible = false
              Message({
                message: '添加数据成功！',
                type: 'success'
              })
            } else {
              Message({
                message: '添加数据失败！',
                type: 'error'
              })
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    /* 修改按钮 */
    updateCollectionForm (formname) {
      this.$refs[formname].validate((valid) => {
        if (valid) {
          this.$axios({
            method: 'put',
            url: this.$httpUrl + '/student',
            data: this.ruleForm
          }).then((response) => {
            if (response.data.code === 200) {
              this.loadPost()
              this.dialogFormVisible = false
              Message({
                message: '修改数据成功！',
                type: 'success'
              })
            } else {
              Message({
                message: '修改数据失败！',
                type: 'error'
              })
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    /* 删除按钮 */
    deleteVisible (scope) {
      MessageBox({
        message: '确定要删除【' + scope.row.stuUsername + '】吗？',
        title: '提示',
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios({
          method: 'delete',
          url: this.$httpUrl + `/student/${scope.row.stuNo}`,
          data: scope.row
        }).then((response) => {
          if (response.data.code === 200) {
            this.loadPost()
            this.dialogFormVisible = false
            Message({
              message: '删除完毕',
              type: 'error'
            })
          } else {
            Message({
              message: '删除数据失败！',
              type: 'error'
            })
          }
        })
      })
    },
    // del (id) {
    //   console.log(id)

    //   this.$axios.get(this.$httpUrl + '/student/' + id).then(res => res.data).then(res => {
    //     console.log(res)
    //     if (res.code === 200) {
    //       this.$message({
    //         message: '操作成功！',
    //         type: 'success'
    //       })
    //       this.loadPost()
    //     } else {
    //       this.$message({
    //         message: '操作失败！',
    //         type: 'error'
    //       })
    //     }
    //   })
    // },
    // mod (row) {
    //   console.log(row)

    //   this.centerDialogVisible = true
    //   this.$nextTick(() => {
    //     // 赋值到表单
    //     this.form.id = row.id
    //     this.form.no = row.no
    //     this.form.name = row.name
    //     this.form.password = ''
    //     this.form.age = row.age + ''
    //     this.form.sex = row.sex + ''
    //     this.form.phone = row.phone
    //     this.form.roleId = row.roleId
    //   })
    // },
    // add () {
    //   this.centerDialogVisible = true
    //   this.$nextTick(() => {
    //     this.resetForm()
    //   })
    // },
    // doSave () {
    //   this.$axios.post(this.$httpUrl + '/student/save', this.form).then(res => res.data).then(res => {
    //     console.log(res)
    //     if (res.code === 200) {
    //       this.$message({
    //         message: '操作成功！',
    //         type: 'success'
    //       })
    //       this.centerDialogVisible = false
    //       this.loadPost()
    //       this.resetForm()
    //     } else {
    //       this.$message({
    //         message: '操作失败！',
    //         type: 'error'
    //       })
    //     }
    //   })
    // },
    // doMod () {
    //   this.$axios.post(this.$httpUrl + '/student/update', this.form).then(res => res.data).then(res => {
    //     console.log(res)
    //     if (res.code === 200) {
    //       this.$message({
    //         message: '操作成功！',
    //         type: 'success'
    //       })
    //       this.centerDialogVisible = false
    //       this.loadPost()
    //       this.resetForm()
    //     } else {
    //       this.$message({
    //         message: '操作失败！',
    //         type: 'error'
    //       })
    //     }
    //   })
    // },
    // save () {
    //   this.$refs.form.validate((valid) => {
    //     if (valid) {
    //       if (this.form.id) {
    //         this.doMod()
    //       } else {
    //         this.doSave()
    //       }
    //     } else {
    //       console.log('error submit!!')
    //       return false
    //     }
    //   })
    // },
    handleSizeChange (val) {
      console.log(`每页 ${val} 条`)
      this.pageNum = 1
      this.pageSize = val
      this.loadPost()
    },
    handleCurrentChange (val) {
      console.log(`当前页: ${val}`)
      this.pageNum = val
      this.loadPost()
    },
    loadGet () {
      this.$axios.get(this.$httpUrl + '/student/list').then(res => res.data).then(res => {
        console.log(res)
      })
    },
    resetParam () {
      this.searchQuery = ''
    },
    selectCurrentChange (val) {
      // this.currentRow = val;
      this.$emit('doSelectUser', val)
    },
    async loadPost () {
      await this.$axios.post(this.$httpUrl + '/student/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
        }
      }).then(res => res.data).then(res => {
        // console.log(res)
        if (res.code === 200) {
          this.tableData = res.data
          this.total = res.total
        } else {
          alert('获取数据失败')
        }
      })
    },
    async loadInquire () {
      await this.$axios.post(this.$httpUrl + '/student/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          stuNum: this.searchQuery
        }
      }).then(res => res.data).then(res => {
        // console.log(res)
        if (res.code === 200) {
          this.tableData = res.data
          this.total = res.total
          Message({
            message: '查询成功！',
            type: 'success'
          })
        } else {
          alert('获取数据失败')
        }
      })
    }
  },
  beforeMount () {
    // this.loadGet();
    this.loadPost()
  }
}
</script>

<style>

</style>
