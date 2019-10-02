<template>

	<div>{{french}}<br> >> <input :class="fontcolor" v-model="name"> <span>ok ! </span>
	
	</div>

</template>

<script>

export default{
	data() {
    return {
      	name: '',
      	response:'',
		fontcolor:"",
		isok:false
    	}
  	},
	props:['german','french'],
	computed:{
		isRight:function(){
			return  this.german.indexof( this.name ) ;
		}
	},
	methods:{
		log:function(smsg){
			console.log(smsg) ;
		},
		show:function(){
			this.log("ok") ;
			this.log(this.german) ;
			this.response = this.german ;
		}
	},
	watch:{
		name:function(newv, oldv){
			this.log(newv + " " + oldv) ;
			var s = this.german ;
			if (s.indexOf( this.name ) == false ) 
				this.fontcolor = "right" ;
			else 
				this.fontcolor = "wrong" ;
			if (this.german === this.name)
				this.isok = true ;
				
		}	
	}
}

</script>

