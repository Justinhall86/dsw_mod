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
					"name": "NOt",
					"scaleX": 0.3500000000000001,
					"scaleY": 0.3500000000000001,
					"scaleZ": 0.3500000000000001,
					"children": [
						{
							"type": "polygon",
							"name": "cross",
							"scaleX": 9.35,
							"scaleY": 0.45,
							"scaleZ": 5,
							"rotationZ": 19.09,
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
										"texture": "Fx/Gradients/z_FillWhite.jpg"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8392156862745098,
											0.24705882352941178,
											0.24705882352941178
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "cursorout",
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
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
										"texture": "Fx/Alphas/T_Ping_Cursor09.png"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8392156862745098,
											0.24705882352941178,
											0.24705882352941178
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