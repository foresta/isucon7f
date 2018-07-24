## 前準備

* ./env.shのパスを環境に合わせる
* nginx.confのアクセスログのフォーマットを仕込む

```
log_format with_time '$remote_addr - $remote_user [$time_local] '
                         '"$request" $status $body_bytes_sent '
                         '"$http_referer" "$http_user_agent" $request_time';
access_log off;
```

## Profiling


```
# kataribe
$ ./profile_setup.sh on # <- nginx(access.log) & mysql(slow-query)の設定を書き換え
$ ./profile_kataribe.sh
$ ./profile_pt-query-digest.sh
$ ./profile_setup.sh off # 設定を元に戻す
```
