# 代码说明

## 调用百度智能云API实现的语音识别

### 基本情况

1. API文档地址：https://cloud.baidu.com/doc/SPEECH/s/Vk38lxily
2. 一个账号支持50000次免费调用（暂时）
3. 仅支持60s以内的音频文件处理，经实验，.pcm格式文件识别效果最佳

### 实现细节
#### speech.py
调用百度接口，需要申请官方KEY，具体可参考https://zhuanlan.zhihu.com/p/97598929
```
ffmpeg -i {audio.{}} -ss $begin -t $gap -acodec pcm_s16le -f s16le -ac 1 -ar 16000 audio.pcm
PYTHONIOENCODING=utf-8 python speech.py audio.pcm
```

#### run.sh
运行程序，使用linux shell脚本首先把音频分割为若干小段，然后逐段处理，最后写入result.txt文件
```
sh run.sh {audio_file_name} {audio_file_length}
```

### !! PYTHONIOENCODING=utf-8 解决python3中文识别

