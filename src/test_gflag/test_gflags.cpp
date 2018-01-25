#include <iostream>
#include "gflags/gflags.h"
#include <stdint.h>



DEFINE_bool(pass, false, "whether pass the check");//--pass=true/false, --pass/--nopass
DEFINE_string(path, "default_path", "whether pass the check");
//DECLARE_bool, 在其他文件中声明

DEFINE_int32(port, 0, "What port to listen on");
static bool ValidatePort(const char* flagname, std::int32_t value) {
	if (value > 0 && value < 32768)   // value is ok
		return true;
	printf("Invalid value for --%s: %d\n", flagname, (int)value);
	return false;
}




int main(int argc, char *argv[])
{
    gflags::ParseCommandLineFlags(&argc, &argv, true);
	//argc和argv想必大家都很清楚了，说明以下第三个参数的作用：
	//如果设为true，则该函数处理完成后，argv中只保留argv[0]，argc会被设置为1。
	//如果为false，则argv和argc会被保留，但是注意函数会调整argv中的顺序。

    std::cout << "path: " << FLAGS_path << std::endl;

	
	//添加检查
	static const bool port_dummy = gflags::RegisterFlagValidator(&FLAGS_port, &ValidatePort);


    gflags::CommandLineFlagInfo info;
	if (GetCommandLineFlagInfo("port", &info) && info.is_default) {
		FLAGS_port = 27015;
	}

	gflags::SetUsageMessage("command line brew\n"
		"usage: test_gflags <command> <args>\n\n"
		"commands:\n"
		"  train           train or finetune a model\n"
		"  test            score a model\n"
		"  device_query    show GPU diagnostic information\n"
		"  time            benchmark model execution time");


	char c;
	std::cin >> c;

	return 0;
}
