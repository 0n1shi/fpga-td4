# Contraint file

file extension is ".sdc".

## create_clock 

```
create_clock
    -period <period value>
    [-name <clock name>]
    [-waveform <edge list>]
    [-add]
    <source objects>
```

|オプション|説明|
|-|-|
|-period <period value>|クロック周期を指定します。 -period MHz. として周波数を指定することもできます。|
|-name <clock name>|特定のクロックの名前（例 ： sysclock ）。クロック名を指定しない場合、クロック名は割り当てられているノードと同じになります。|
|-waveform <edge list>|クロックの立ち上がりエッジおよび立ち下がりエッジを指定します。エッジ・リストには、立ち上がりエッジと立ち下がりエッジを交互に記述します。例えば、周期が 10 ns で最初の立ち上がりエッジが 0 nsで発生し、最初の立ち下がりエッジが 5ns で発生する場合は、waveform {0 5} と記述します。クロックの 1周期単位以内で両エッジの時刻指定を行います。また、立ち上がりエッジは立ち下がりエッジの前に発生しなければなりません。デフォルトのエッジ・リストは {0 /2}、すなわちデューティ・サイクル 50 % です。|
|-add|同じポートまたはピンに対して 2クロック以上を指定できます。|
|<source objects>|アサインメントが適用されるポートまたはピンを指定します。ソース・オブジェクトが指定されていない場合、クロックはバーチャル・クロックとなります。|

引用: https://www.intel.co.jp/content/www/jp/ja/programmable/support/support-resources/design-examples/design-software/timequest/clocking/tq-create-clock.html#note1