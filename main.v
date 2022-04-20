import def

fn main() {
	res := buggy_return_type()
	res2 := buggy_return_type2()
	// res3 := buggy_return_type3()
	dump(res)
	dump(res2)
	// dump(res3)
}

// type MyFun = fn () T
// type MyFun<T> = fn () T

// fn buggy_return_util<T>(cb MyFun<T>) def.Result<T> {
fn buggy_return_util<T>(cb fn () T) def.Result<T> {
	return def.Result<T>{
		data: cb()
	}
}

fn buggy_return_type() def.Result<def.Inner> {
	return buggy_return_util<def.Inner>(fn () def.Inner {
		return def.Inner{}
	})
}

fn buggy_return_type2() def.Result<def.Inner2> {
	return buggy_return_util<def.Inner2>(fn () def.Inner2 {
		return def.Inner2{}
	})
}

// fn buggy_return_type3() def.Result<def.Inner3> {
// 	return buggy_return_util<def.Inner3>(fn () def.Inner3 {return def.Inner3{}})
// }
