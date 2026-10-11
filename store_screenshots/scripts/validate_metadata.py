"""Local metadata length/preservation checks and a readable review artifact. No network writes."""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
META=ROOT/'metadata'
LIMITS={'name':30,'subtitle':30,'description':4000,'keywords':100,'promotionalText':170,'whatsNew':4000}
SOURCE=ROOT/'.asc/snapshots/2026-10-08'
lines=['# Prepared store metadata', '', 'Supplied copy retained. Existing URLs and release notes preserved.', 'Polish version fields are local only. Its release notes are a draft based on CHANGELOG 1.3.10.', '']
count=0
for info in sorted((META/'app-info').glob('*.json')):
    locale=info.stem
    version=META/'version/1.3.10'/f'{locale}.json'
    lines.extend([f'## {locale}', ''])
    for file in [info,version]:
        fields=json.loads(file.read_text())
        oldfile=SOURCE/file.relative_to(META)
        old=json.loads(oldfile.read_text()) if oldfile.exists() else {}
        for key,value in fields.items():
            assert isinstance(value,str),(file,key)
            assert len(value)<=LIMITS.get(key,float('inf')),(file,key,len(value))
            if key.endswith('Url') or key=='whatsNew':
                if key in old: assert value==old[key],(file,'Changed existing value',key)
            lines.extend([f'### {key}', '', '```text',value,'```',''])
        count+=1
(META/'prepared-texts.md').write_text('\n'.join(lines)+'\n')
print(f'Validated {count} JSON files: lengths, original URLs and release notes. Review: metadata/prepared-texts.md')
