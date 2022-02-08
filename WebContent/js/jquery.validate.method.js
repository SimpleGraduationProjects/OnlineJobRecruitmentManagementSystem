/*****************************************************************

                  jQuery Validate扩展验证方法
*****************************************************************/
$(function(){
	//手机号验证  
	jQuery.validator.addMethod("telphone", function(value, element) {   
		var pattern = /^1[34578]\d{9}$/;
	  return this.optional(element) || (pattern.test(value));
	}, "请输入正确的手机号码");
	
	//身份证验证  
	jQuery.validator.addMethod("idno", function(value, element) {   
		var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	  return this.optional(element) || (pattern.test(value));
	}, "请输入正确的身份证号");
	
	//数字验证
	jQuery.validator.addMethod("decimal", function(value, element) {   
		var pattern = /^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$/;
	  return this.optional(element) || (pattern.test(value));
	}, "请输入正确的数字");
	
	
});
   
 


 