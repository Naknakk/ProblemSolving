import webbrowser
import asyncio

url = "https://www.acmicpc.net/status?from_mine=1&problem_id={}&user_id=lcy26454"
chrome_path = "open -a /Applications/Google\ Chrome.app %s"

async def openProblem(id):
    webbrowser.get(chrome_path).open_new_tab(url.format(id))
    await asyncio.sleep(6)

problems = "2805 2839 2869 2884 2908"
ids = problems.split(" ")

for id in ids:
    asyncio.run(openProblem(id))
