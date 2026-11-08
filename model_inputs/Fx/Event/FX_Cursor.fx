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
					"name": "1",
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
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
											0.8784313725490196,
											0.8156862745098039,
											0.6941176470588235
										]
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