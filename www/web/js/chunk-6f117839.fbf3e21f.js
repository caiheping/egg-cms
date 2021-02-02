(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-6f117839"],{"25dd":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"app-container"},[r("el-row",{attrs:{gutter:10}},[r("el-col",{attrs:{span:1.5}},[r("el-button",{directives:[{name:"has-permi",rawName:"v-has-permi",value:["system:department:add"],expression:"['system:department:add']"}],attrs:{type:"primary",icon:"el-icon-plus",size:"mini"},on:{click:e.handleAdd}},[e._v("新增")])],1)],1),r("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.$store.state.app.loading,expression:"$store.state.app.loading"}],attrs:{data:e.deptList,"row-key":"deptId","default-expand-all":"","tree-props":{children:"children",hasChildren:"hasChildren"}}},[r("el-table-column",{attrs:{prop:"deptName",label:"部门名称",width:"260"}}),r("el-table-column",{attrs:{prop:"orderNum",label:"排序",width:"200"}}),r("el-table-column",{attrs:{prop:"status",label:"状态",formatter:e.statusFormat,width:"100"}}),r("el-table-column",{attrs:{label:"创建时间",align:"center",formatter:e.dateFormatter,prop:"createdAt",width:"200"}}),r("el-table-column",{attrs:{label:"操作",align:"center","class-name":"small-padding fixed-width"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("el-button",{directives:[{name:"has-permi",rawName:"v-has-permi",value:["system:department:add"],expression:"['system:department:add']"}],attrs:{size:"mini",type:"text",icon:"el-icon-plus"},on:{click:function(r){return e.handleAdd(t.row)}}},[e._v("新增")]),r("el-button",{directives:[{name:"has-permi",rawName:"v-has-permi",value:["system:department:update"],expression:"['system:department:update']"}],attrs:{size:"mini",type:"text",icon:"el-icon-edit"},on:{click:function(r){return e.handleUpdate(t.row)}}},[e._v("修改")]),0!=t.row.parentId?r("el-button",{directives:[{name:"has-permi",rawName:"v-has-permi",value:["system:department:delete"],expression:"['system:department:delete']"}],staticClass:"delete",attrs:{size:"mini",type:"text",icon:"el-icon-delete"},on:{click:function(r){return e.handleDelete(t.row)}}},[e._v("删除")]):e._e()]}}])})],1),r("el-dialog",{attrs:{title:e.title,visible:e.open,width:"600px","append-to-body":"","close-on-click-modal":!1},on:{"update:visible":function(t){e.open=t}}},[r("el-form",{ref:"form",attrs:{model:e.form,rules:e.rules,"label-width":"80px"}},[r("el-row",[0!==e.form.parentId?r("el-col",{attrs:{span:24}},[r("el-form-item",{attrs:{label:"上级部门",prop:"parentId"}},[r("treeselect",{attrs:{options:e.deptOptions,normalizer:e.normalizer,placeholder:"选择上级部门"},model:{value:e.form.parentId,callback:function(t){e.$set(e.form,"parentId",t)},expression:"form.parentId"}})],1)],1):e._e(),r("el-col",{attrs:{span:12}},[r("el-form-item",{attrs:{label:"部门名称",prop:"deptName"}},[r("el-input",{attrs:{placeholder:"请输入部门名称"},model:{value:e.form.deptName,callback:function(t){e.$set(e.form,"deptName",t)},expression:"form.deptName"}})],1)],1),r("el-col",{attrs:{span:12}},[r("el-form-item",{attrs:{label:"显示排序",prop:"orderNum"}},[r("el-input-number",{attrs:{"controls-position":"right",min:0},model:{value:e.form.orderNum,callback:function(t){e.$set(e.form,"orderNum",t)},expression:"form.orderNum"}})],1)],1),r("el-col",{attrs:{span:12}},[r("el-form-item",{attrs:{label:"部门状态"}},[r("el-radio-group",{model:{value:e.form.status,callback:function(t){e.$set(e.form,"status",t)},expression:"form.status"}},e._l(e.statusOptions,(function(t){return r("el-radio",{key:t.dictValue,attrs:{label:t.dictValue}},[e._v(e._s(t.dictLabel))])})),1)],1)],1)],1)],1),r("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{attrs:{type:"primary"},on:{click:e.submitForm}},[e._v("确 定")]),r("el-button",{on:{click:e.cancel}},[e._v("取 消")])],1)],1)],1)},a=[],s=(r("bf00"),r("cc1d")),i=r("7d66"),o=r.n(i),l=(r("5166"),{name:"Dept",components:{Treeselect:o.a},data:function(){return{deptList:[],deptOptions:[],title:"",open:!1,statusOptions:[],form:{},rules:{parentId:[{required:!0,message:"上级部门不能为空",trigger:"blur"}],deptName:[{required:!0,message:"部门名称不能为空",trigger:"blur"}],orderNum:[{required:!0,message:"菜单顺序不能为空",trigger:"blur"}]}}},created:function(){var e=this;this.getList(),this.getDicts("sys_normal_disable").then((function(t){e.statusOptions=t.data}))},methods:{getList:function(){var e=this;Object(s["c"])().then((function(t){var r=e.handleTree(t.data.rows,"deptId","parentId","children",e.$store.state.user.userInfo.user.deptId).tree,n=t.data.rows.filter((function(t){return t.deptId===e.$store.state.user.userInfo.user.deptId}));n[0].children=r,e.deptList=n,e.deptOptions=n}))},normalizer:function(e){return e.children&&!e.children.length&&delete e.children,{id:e.deptId,label:e.deptName,children:e.children}},statusFormat:function(e,t){return this.selectDictLabel(this.statusOptions,e.status)},cancel:function(){this.open=!1,this.reset()},reset:function(){this.form={deptId:void 0,parentId:void 0,deptName:void 0,orderNum:void 0,status:"1"},this.resetForm("form")},handleQuery:function(){this.getList()},handleAdd:function(e){this.reset(),void 0!==e&&(this.form.parentId=e.deptId),this.open=!0,this.title="添加部门"},handleUpdate:function(e){var t=this;this.reset(),Object(s["d"])(e.deptId).then((function(e){t.form=e.data,t.open=!0,t.title="修改部门"}))},submitForm:function(){var e=this;this.$refs.form.validate((function(t){t&&(void 0!==e.form.deptId?Object(s["e"])(e.form).then((function(t){e.$httpResponse(t.message),e.open=!1,e.getList()})):Object(s["a"])(e.form).then((function(t){e.$httpResponse(t.message),e.open=!1,e.getList()})))}))},handleDelete:function(e){var t=this;this.$confirm('是否确认删除名称为"'+e.deptName+'"的数据项?',"警告",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){return Object(s["b"])(e.deptId)})).then((function(){t.getList(),t.$httpResponse("删除成功")})).catch((function(){}))}}}),d=l,c=r("5d22"),p=Object(c["a"])(d,n,a,!1,null,null,null);t["default"]=p.exports},cc1d:function(e,t,r){"use strict";r.d(t,"c",(function(){return a})),r.d(t,"d",(function(){return s})),r.d(t,"b",(function(){return i})),r.d(t,"a",(function(){return o})),r.d(t,"e",(function(){return l}));var n=r("b775");function a(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return Object(n["a"])("/admin/system/department","get",e,!1)}function s(e){return Object(n["a"])("/admin/system/department/"+e,"get",{},!1)}function i(e){return Object(n["a"])("/admin/system/department/"+e,"delete")}function o(e){return Object(n["a"])("/admin/system/department","post",e)}function l(e){return Object(n["a"])("/admin/system/department/"+e.deptId,"put",e)}}}]);