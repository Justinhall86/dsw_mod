{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": -0.28002,
			"y": 0.45299,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "Alpha",
							"shadows": false,
							"culling": "Back",
							"colorMask": 255
						}
					},
					"color": [
						0,
						0,
						0,
						1
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 2.5,
			"scaleY": 2.5,
			"scaleZ": 2.5,
			"children": [
				{
					"type": "object",
					"name": "Operation",
					"scaleX": 0.35000000000000003,
					"scaleY": 0.35000000000000003,
					"scaleZ": 0.35000000000000003,
					"children": [
						{
							"type": "polygon",
							"name": "Round",
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "Always"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_UI_Round_128.png"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8784313725490196,
											0.8156862745098039,
											0.6941176470588235
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "cursorout",
							"scaleX": 11,
							"scaleY": 11,
							"scaleZ": 11,
							"rotationZ": 90,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "Always"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Ping_Cursor06-1.png"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8784313725490196,
											0.8156862745098039,
											0.6941176470588235
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.017585623684655997,
												"dt": -0.4999370237417995
											},
											"nextHandle": {
												"dv": -0.002472766501621093,
												"dt": 0.16233011653040905
											}
										},
										{
											"time": 0.19816923316699286,
											"value": 0.75,
											"mode": 2
										},
										{
											"time": 0.5809259259259258,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.057511827005235494,
												"dt": -0.20356110957601392
											},
											"nextHandle": {
												"dv": -0.06971888582276542,
												"dt": 0.24718616900868967
											}
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}