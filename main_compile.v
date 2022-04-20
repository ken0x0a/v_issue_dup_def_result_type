import def

fn main() {
	res := buggy_return_type()
	res2 := buggy_return_type2()
	res3 := buggy_return_type3()
	dump(res)
	dump(res2)
	dump(res3)
}

fn buggy_return_util<T>() def.Result<T> {
	return def.Result<T>{
		data: T{}
	}
}

fn buggy_return_type() def.Result<def.Inner> {
	return buggy_return_util<def.Inner>()
}

fn buggy_return_type2() def.Result<def.Inner2> {
	return buggy_return_util<def.Inner2>()
}

fn buggy_return_type3() def.Result<def.Inner3> {
	return buggy_return_util<def.Inner3>()
}
