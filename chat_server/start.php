<?php
/**
 * run with command 
 * php start.php start
 */

ini_set('display_errors', 'on');
use Workerman\Worker;

if(strpos(strtolower(PHP_OS), 'win') === 0)
{
    exit("start.php not support windows, please use start_for_win.bat\n");
}

// 检查扩展
if(!extension_loaded('pcntl'))
{
    exit("Please install pcntl extension. See http://doc3.workerman.net/appendices/install-extension.html\n");
}

if(!extension_loaded('posix'))
{
    exit("Please install posix extension. See http://doc3.workerman.net/appendices/install-extension.html\n");
}

// 标记是全局启动
define('GLOBAL_START', 1);

require_once __DIR__ . '/vendor/autoload.php';

// 加载所有Applications/*/start.php，以便启动所有服务
foreach(glob(__DIR__.'/Applications/*/start*.php') as $start_file)
{
    require_once $start_file;
}

if (isset($argv[2]) && in_array($argv[2], ['dev', 'qa','stage', 'prod'])) {
	// 加载所有开发/生产配置文件 终端模式
	foreach(glob(__DIR__.'/config/'.$argv[2].'_*.php') as $config_file)
	{
		// 获取文件名
		$filename = basename($config_file, '.php');
		// 根据环境变量分割文件名
		$key = substr($filename, strlen($argv[2])+1);
	    $config[$key] = require_once $config_file;
	}
} elseif (isset($argv[3]) && in_array($argv[3], ['dev', 'qa','stage', 'prod'])) {
	// 加载所有开发/生产配置文件 后台模式
	foreach(glob(__DIR__.'/config/'.$argv[3].'_*.php') as $config_file)
	{
		// 获取文件名
		$filename = basename($config_file, '.php');
		// 根据环境变量分割文件名
		$key = substr($filename, strlen($argv[3])+1);
	    $config[$key] = require_once $config_file;
	}	
}

if (!isset($config)) {
    exit("Config is require!\n");
}
// 运行所有服务
Worker::runAll($config);
