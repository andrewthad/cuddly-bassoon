module Book02 where

import LoneWolf

chapters :: [(Int, Decision)]
chapters =
  [ ( 1
    , (Decisions
           [ ( NoDecision (Goto 273))
           , ( NoDecision (Goto 160))
           ]))--
  , ( 10
    , ((NoDecision
              (
                 (Goto 51)))))
  , ( 12
    , (Decisions
           [  (NoDecision (Goto 58))
           ,  (NoDecision (Goto 58))
           ]))
  , ( 13
    , (NoDecision (Goto 155)))
  , ( 14
    , (NoDecision (Goto 305)))
  , ( 15
    , (NoDecision (Goto 244)))
  , ( 16
    , (NoDecision (Goto 268)))
  , ( 17
    , (NoDecision
           (
              (Fight 30
                 (Goto 166)))))
  , ( 18
    , (Decisions
           [ ( NoDecision (Goto 173))
           , ( NoDecision (Goto 266))
           , ( NoDecision (Goto 310))
           ]))
  , ( 19
    , (NoDecision (Goto 71)))
  , ( 25
    , (NoDecision ( ( Goto 116))))
  , ( 26
    , (Decisions
           [ ( NoDecision (Goto 248))
           , ( NoDecision (Goto 66))
           ]))
  , ( 27
    , (NoDecision
           ((Goto 312))))
  , ( 28
    , (Decisions
           [ ( NoDecision (Goto 106))
           , ( NoDecision (Goto 320))
           ]))
  , ( 29
    , (NoDecision
           ((Goto 222))))
  , ( 30
    , (NoDecision
           (Fight 16
              (Goto 258))))
  , ( 31
    , (NoDecision
           (
              ((Goto 176)))))
  , ( 32
    , (NoDecision ((Goto 186))))
  , ( 33
    , (Decisions
           [ (NoDecision (Goto 296))
           , ( NoDecision (Goto 88))
           ]))
  , ( 34
    , (NoDecision
           (Fight 14
              (Goto 345))))
  , ( 35
    , (Decisions
           [ (  (NoDecision (Goto 13)))
           , (
                 (NoDecision (Goto 155)))
           , (
                 (NoDecision (Goto 293)))
           ]))
  , ( 36
    , (NoDecision
           (
               (Goto 145)
              )))
  , ( 37
    , (Decisions
           [ ( NoDecision ((Goto 122)))
           , ( NoDecision ((Goto 323)))
           , ( NoDecision ((Goto 257)))
           ]))
  , ( 38
    , (Decisions
           [ ( NoDecision (Goto 269))
           , ( NoDecision (Goto 313))
           ]))
  , ( 39
    , (NoDecision
           (
              (Goto 346))))
  , ( 40
    , (NoDecision
           (
              ( (Goto 97)))))
  , ( 41
    , (Decisions
           [ ( NoDecision
                 ((Goto 194)))
           , ( NoDecision (Goto 251))
           ]))
  , ( 42
    , (NoDecision (Goto 168)))
  , ( 43
    , (NoDecision (Goto 286)))
  , ( 45
    , (NoDecision (Goto 311)))
  , ( 46
    , (Decisions
           [ ( NoDecision (Goto 214))
           , ( NoDecision (Goto 230))
           ]))
  , ( 47
    , (NoDecision
           (Goto 111)))
  , ( 48
    , (NoDecision (Goto 268)))
  , ( 49
    , (NoDecision (Goto 100)))
  , ( 50
    , (NoDecision (Goto 249)))
  , ( 51
    , (Decisions
           [ ( NoDecision (Goto 103))
           , ( NoDecision (Goto 249))
           ]))
  , ( 52
    , (NoDecision
           (Goto 338)))
  , ( 53
    , (Decisions
           [ ( NoDecision (Goto 321))
           , ( NoDecision (Goto 154))
           ]))
  , ( 55
    ,    (Decisions
              [ ( NoDecision (Goto 347))
              , ( NoDecision (Goto 3))
              ]))
  , ( 56
    , (NoDecision (Goto 127)))
  , ( 57
    , (NoDecision
           (
               ((Goto 282))
              )))
  , ( 58
    , (NoDecision (Goto 197)))
  , ( 59
    , (NoDecision
           (
               (Goto 332)
              )))
  , ( 60
    , (NoDecision
           (Fight 11
              (Goto 76))))
  , ( 61
    , (NoDecision (Goto 181)))
  , ( 63
    , (Decisions
           [ (  (NoDecision (Goto 264)))
           , (
                 (NoDecision (Goto 188)))
           , (
                 (NoDecision (Goto 201)))
           ]))
  , ( 64
    , (Decisions
           [ (  (NoDecision (Goto 229)))
           , (
                 (NoDecision (Goto 134)))
           , (
                 (NoDecision (Goto 208)))
           ]))
  , ( 65
    , (NoDecision (Goto 32)))
  , ( 66
    , (NoDecision
           (Fight 15
              (Goto 218))))
  , ( 67
    , (NoDecision (Goto 300)))
  , ( 68
    , (NoDecision (Goto 306)))
  , ( 69
    , (NoDecision
           (
               (Goto 311)
              )))
  , ( 70
    , (NoDecision (Goto 44)))
  , ( 71
    , (Decisions
           [ ( NoDecision (Goto 11))
           , ( NoDecision (Goto 54))
           , ( NoDecision (Goto 235))
           ]))
  , ( 72
    , (Decisions
           [ ( NoDecision
                 ((Goto 226)))
           , ( NoDecision
                 ((Goto 56)))
           , ( NoDecision
                 ((Goto 276)))
           ]))
  , ( 73
    , (NoDecision (Goto 336)))
  , ( 74
    , (NoDecision (Goto 240)))
  , ( 76
    , (( (NoDecision (Goto 33)))))
  , ( 77
    , (Decisions
           [ ( NoDecision (Goto 320))
           , ( NoDecision (Goto 28))
           ]))
  , ( 78
    , (Decisions
           [ ( NoDecision
                 (
                    (Goto 278)))
           , ( NoDecision
                 (
                    (Goto 337)))
           ]))
  , ( 79
    , ((NoDecision (Goto 40))))
  , ( 80
    , (Decisions
           [ (  (NoDecision (Goto 15)))
           , ( NoDecision (Goto 189))
           ]))
  , ( 81
    , (NoDecision ((Goto 260))))
  , ( 82
    , (Decisions
           [ ( NoDecision (Goto 55))
           , ( NoDecision (Goto 347))
           ]))
  , ( 83
    , (Decisions
           [ ( NoDecision (Goto 227))
           , ( NoDecision (Goto 297))
           ]))
  , ( 85
    , (NoDecision
           (Fight 27
              (Goto 124))))
  , ( 86
    , ((              (Decisions
                 [ ( NoDecision (Goto 215))
                 , ( NoDecision (Goto 303))
                 , ( NoDecision (Goto 129))
                 ]))))
  , ( 88
    , (Decisions
           [ (  (NoDecision (Goto 179)))
           , ( NoDecision (Goto 150))
           , ( NoDecision (Goto 71))
           ]))
  , ( 89
    , (Decisions
           [ ( NoDecision (Goto 233))
           , ( NoDecision (Goto 212))
           ]))
  , ( 90
    , (NoDecision (Fight 16
           (Fight 9
              (Fight 14
                 (Fight 8
                    (Fight 17
                       (Goto 274))))))))
  , ( 91 , (Decisions []))
  , ( 92
    , (NoDecision (Goto 183)))
  , ( 93
    , (NoDecision (Goto 137)))
  , ( 94
    , (NoDecision (Goto 240)))
  , ( 95
    , (NoDecision
           (
              (Goto 239))))
  , ( 96
    , (NoDecision (Goto 112)))
  , ( 97
    , (NoDecision (Goto 152)))
  , ( 98
    , (Decisions
           [ ( NoDecision (Goto 244))
           , ( NoDecision (Goto 115))
           ]))
  , ( 99
    , (NoDecision ((Goto 326))))
  , ( 160 , (NoDecision (Goto 268))) --
  , ( 174
    , (NoDecision (Goto 162)))
  , ( 175
    , (NoDecision ((Goto 53))))
  , ( 176
    , (Decisions
           [ (  (NoDecision (Goto 322)))
           , (
                 (NoDecision (Goto 45)))
           , (
                 (NoDecision (Goto 277)))
           ]))
  , ( 177
    , (Decisions
           [ ( NoDecision (Goto 276))
           , ( NoDecision (Goto 342))
           ]))
  , ( 178
    , (NoDecision (Goto 200)))
  , ( 179
    , (Decisions
           [ ( NoDecision (Goto 82))
           , ( NoDecision (Goto 150))
           , ( NoDecision (Goto 71))
           ]))
  , ( 180
    , (NoDecision (Goto 337)))
  , ( 181
    , (NoDecision (Goto 186)))
  , ( 182
    , (NoDecision (Goto 177)))
  , ( 183
    , (NoDecision ((Goto 311))))
  , ( 184
    , (NoDecision (Goto 240)))
  , ( 185
    , (NoDecision (Fight 25
           (Fight 26
              (Goto 120)))))
  , ( 186
    , (Decisions []))
  , ( 187
    , (NoDecision (Goto 265)))
  , ( 188
    , (NoDecision (Goto 312)))
  , ( 189
    , (Decisions
           [ ( NoDecision
                 (
                    (Goto 162)))
           , ( NoDecision
                 (
                    (Goto 244)))
           ]))
  , ( 192
    , (NoDecision (Goto 32)))
  , ( 193
    , (NoDecision (Goto 100)))
  , ( 194
    , (Decisions
           [ ( NoDecision
                 (
                    (Goto 215)))
           , ( NoDecision
                 (
                    (Goto 303)))
           , ( NoDecision
                 (
                    (Goto 129)))
           , ( NoDecision
                 (
                    (Goto 86)))
           ]))
  , ( 195
    , (NoDecision
           (
               ((Goto 249))
              )))
  , ( 196
    , (NoDecision
           (
              (
                 (Goto 79)))))
  , ( 197
    , (NoDecision
           ((Goto 78))))
  , ( 198
    , (NoDecision
           ((Goto 138))))
  , ( 199
    , (NoDecision (Goto 143)))
  , ( 200
    , (Decisions
           [ ( NoDecision (Goto 7))
           , ( NoDecision (Goto 60))
           , ( NoDecision (Goto 85))
           , ( NoDecision (Goto 158))
           , ( NoDecision (Goto 270))
           ]))
  , ( 201
    , (NoDecision ((Goto 285))))
  , ( 202
    , (NoDecision (Goto 31)))
  , ( 203
    , (NoDecision (Goto 268)))
  , ( 204
    , (Decisions
           [ ( NoDecision (Goto 73))
           , ( NoDecision (Goto 267))
           ]))
  , ( 205
    , (NoDecision (Goto 213)))
  , ( 206
    , (NoDecision (Goto 312)))
  , ( 207
    , (NoDecision (Goto 47)))
  , ( 208
    , (NoDecision (Goto 134)))
  , ( 209
    , (NoDecision (Goto 197)))
  , ( 210
    , (NoDecision (Goto 275)))
  , ( 215
    , (Decisions
           [ ( NoDecision (Goto 4))
           , ( NoDecision (Goto 83))
           ]))
  , ( 216
    , (NoDecision (Goto 100)))
  , ( 217
    , (Decisions
           [ (
                 (NoDecision ((Goto 199))))
           , ( NoDecision (Goto 143))
           ]))
  , ( 218
    , (Decisions
           [ ( NoDecision (Goto 43))
           , ( NoDecision (Goto 105))
           ]))
  , ( 219
    , (NoDecision
           ( (Goto 312))))
  , ( 220
    , ( (NoDecision (Goto 33))))
  , ( 221
    , (NoDecision (Goto 88)))
  , ( 222
    , (Decisions
           [ ( NoDecision (Goto 175))
           , ( NoDecision (Goto 315))
           ]))
  , ( 223
    , (NoDecision (Goto 265)))
  , ( 224
    , (Decisions
           [ ( NoDecision (Goto 146))
           , ( NoDecision (Goto 34))
           ]))
  , ( 225
    , (NoDecision (Goto 350)))
  , ( 226
    , (Decisions
           [ (
                 (NoDecision ((Goto 56))))
           , ( NoDecision (Goto 276))
           ]))
  , ( 227
    , (NoDecision (Goto 4)))
  , ( 228
    , (Decisions
           [ ( NoDecision (Goto 27))
           , ( NoDecision (Goto 114))
           ]))
  , ( 229
    , (Decisions
           [ ( NoDecision (Goto 134))
           , ( NoDecision (Goto 208))
           , ( NoDecision (Goto 164))
           ]))
  , ( 230
    , (Decisions
           [ ( NoDecision (Goto 93))
           , ( NoDecision (Goto 137))
           ]))
  , ( 231
    ,          (Decisions
                    [ (
                          (NoDecision (Goto 182)))
                    , (
                          (NoDecision (Goto 177)))
                    , (
                          (NoDecision (Goto 24)))
                    , (
                          (NoDecision (Goto 253)))
                    , (
                          (NoDecision (Goto 319)))
                    ]))
  , ( 232
    , (Decisions
           [ (  (NoDecision (Goto 149)))
           , ( NoDecision (Goto 250))
           , ( NoDecision (Goto 68))
           , (   (NoDecision (Goto 223)))
           ]))
  , ( 233
    , (Decisions
           [ (
                 (NoDecision ((Goto 37))))
           , (
                 (NoDecision ((Goto 148))))
           , ( NoDecision (Goto 292))
           ]))
  , ( 235
    , (
           (Decisions
              [ ( NoDecision (Goto 132))
              , ( NoDecision (Goto 90))
              ])))
  , ( 236
    , (NoDecision (Goto 222)))
  , ( 237
    , (NoDecision
           (Fight 30
              (Goto 309))))
  , ( 238
    , (Decisions []))
  , ( 239
    , (NoDecision
           ((Goto 77))))
  , ( 240
    , (Decisions
           [ (
                 (Decisions
                    [ ( NoDecision ((Goto 29)))
                    , ( NoDecision ((Goto 236)))
                    , ( NoDecision ((Goto 101)))
                    ]))
           , (
                 (Decisions
                    [ ( NoDecision ((Goto 29)))
                    , ( NoDecision ((Goto 236)))
                    , ( NoDecision ((Goto 101)))
                    ]))
           ]))
  , ( 241
    , (NoDecision
           (Fight 25
              (Goto 21))))
  , ( 242
    , (NoDecision (Goto 152)))
  , ( 243
    , (NoDecision (Goto 240)))
  , ( 244
    , (Decisions
           [ (  (NoDecision (Goto 147)))
           , (  (NoDecision (Goto 47)))
           , (
                 (NoDecision (Goto 207)))
           ]))
  , ( 245
    , (Decisions
           [ ( NoDecision (Goto 266))
           , ( NoDecision (Goto 310))
           ]))
  , ( 249
    , (NoDecision (Goto 39)))
  , ( 250
    , (Decisions
           [ ( NoDecision (Goto 244))
           , ( NoDecision (Goto 68))
           , (   (NoDecision (Goto 223)))
           ]))
  , ( 251
    , (NoDecision (Goto 194)))
  , ( 253
    , (Decisions
           [ ( NoDecision (Goto 303))
           , ( NoDecision (Goto 177))
           ]))
  , ( 254
    , (Decisions
           [ (  (NoDecision (Goto 344)))
           , (
                 (NoDecision (Goto 69)))
           , (
                 (NoDecision (Goto 183)))
           ]))
  , ( 255
    , (NoDecision (Goto 268)))
  , ( 256
    , (NoDecision (Goto 134)))
  , ( 257
    , (Decisions
           [ ( NoDecision (Goto 335))
           , ( NoDecision (Goto 181))
           ]))
  , ( 258
    , (Decisions
           [ (  (NoDecision (Goto 272)))
           , (
                 (NoDecision (Goto 17)))
           , (
                 (NoDecision (Goto 5)))
           ]))
  , ( 259
    , (NoDecision (Goto 161)))
  , ( 260
    , ((NoDecision (Goto 240))))
  , ( 261
    , (Decisions
           [ ( NoDecision (Goto 95))
           , ( NoDecision (Goto 198))
           ]))
  , ( 262
    , (NoDecision (Goto 65)))
  , ( 264
    , (NoDecision (Goto 312)))
  , ( 265
    , (NoDecision
           (Goto 202)))
  , ( 266
    , (NoDecision
           (Goto 32)))
  , ( 267
    , (Decisions
           [ ( NoDecision (Goto 128))
           , ( NoDecision (Goto 309))
           ]))
  , ( 268
    , (NoDecision (Fight 25
           (Goto 333))))
  , ( 269
    , (NoDecision (Goto 349)))
  , ( 270
    , (NoDecision
           (Fight 30
              (Goto 33))))
  , ( 271
    , (Decisions
           [ (  (NoDecision (Goto 151)))
           , (
                 (NoDecision (Goto 157)))
           , (
                 (NoDecision (Goto 65)))
           ]))
  , ( 272
    , (NoDecision (Goto 5)))
  , ( 273
    , (NoDecision (Goto 160)))
  , ( 274
    , ((
              ((NoDecision (Goto 132))))))
  , ( 276
    , (Decisions
           [ (  (NoDecision (Goto 14)))
           , (
                 (NoDecision
                    (Fight 25
                       (Goto 305))))
           ]))
  , ( 277
    , (Decisions
           [ ( NoDecision (Goto 311))
           , ( NoDecision (Goto 59))
           ]))
  , ( 278
    , (NoDecision (Goto 41)))
  , ( 279
    , (Decisions
           [ ( NoDecision (Goto 23))
           , ( NoDecision (Goto 340))
           ]))
  , ( 280
    , (NoDecision ((Goto 2))))
  , ( 281
    , (NoDecision (Goto 240)))
  , ( 282
    , (NoDecision
           (Fight 24
              (Fight 22
                 (Goto 187)))))
  , ( 283
    , (NoDecision (Goto 245)))
  , ( 284
    , (NoDecision ((Goto 9))))
  , ( 285
    , (NoDecision (Goto 312)))
  , ( 286
    , (NoDecision (Goto 109)))
  , ( 287
    , (NoDecision (Goto 175)))
  , ( 288
    , (NoDecision (Goto 244)))
  , ( 289
    , (Decisions
           [ ( NoDecision
                 (
                    (Goto 165)))
           , ( NoDecision (Goto 186))
           ]))
  , ( 298
    , (NoDecision (Fight 23
           (Fight 21
              (Fight 20
                 (Goto 301)))))) --
  , ( 300 , (NoDecision ( (Goto 224)))) --
  , ( 312
    , (Decisions
           [ ( NoDecision (Goto 117))
           , ( NoDecision (Goto 89))
           ])) --
  , ( 321
    , (Decisions
           [ (
                 (Decisions
                    [ ( NoDecision ((Goto 12)))
                    , ( NoDecision ((Goto 197)))
                    ]))
           , (
                 (Decisions
                    [ ( NoDecision
                          (
                             (Goto 12)))
                    , ( NoDecision
                          (
                             (Goto 197)))
                    ]))
           ])) --
  , ( 323
    , (Decisions
           [ ( NoDecision (Goto 131))
           , ( NoDecision (Goto 298))
           , ( NoDecision (Goto 121))
           ])) --
  , ( 333
    , (Decisions
           [ ( NoDecision (Goto 300))
           , ( NoDecision (Goto 67))
           ])) --
  , ( 337
    , (Decisions
           [ (
                 (NoDecision
                    ((Goto 139))))
           , (
                 (NoDecision
                    ((Goto 228))))
           , (
                 (NoDecision
                    ((Goto 171))))
           ])) --
  , ( 345
    , (NoDecision
           (Fight 24
              (Goto 243)))) --
  ]
