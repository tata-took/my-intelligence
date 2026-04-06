@echo off
echo ================================================
echo  my-intelligence セットアップ開始
echo ================================================
echo.

:: ① Gitの確認
echo [1/5] Git確認中...
git --version
if %errorlevel% neq 0 (
    echo ❌ Gitが入っていません
    echo https://git-scm.com からインストールしてください
    pause
    exit
)
echo ✅ Git OK

:: ② Dockerの確認
echo [2/5] Docker確認中...
docker --version
if %errorlevel% neq 0 (
    echo ❌ Docker Desktop が入っていません
    echo https://www.docker.com/products/docker-desktop
    echo インストール後に再実行してください
    pause
    exit
)
echo ✅ Docker OK

:: ③ .envファイルの作成
echo [3/5] .envファイルを確認中...
if not exist .env (
    copy .env.example .env
    echo ✅ .envファイルを作成しました
    echo ⚠️  .envを開いてAPIキーを入力してください
    notepad .env
) else (
    echo ✅ .envファイルは既にあります
)

:: ④ n8nを起動
echo [4/5] n8nを起動中...
docker compose up -d
echo ✅ n8n起動完了

:: ⑤ 確認
echo [5/5] 動作確認...
echo.
echo ================================================
echo  セットアップ完了！
echo ================================================
echo.
echo 次のURLをブラウザで開いてください：
echo http://localhost:5678
echo.
pause