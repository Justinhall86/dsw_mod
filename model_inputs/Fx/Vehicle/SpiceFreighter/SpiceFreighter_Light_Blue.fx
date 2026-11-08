{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.001,
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0,
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
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"parallax": 0,
									"emissive": 20
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.06,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.15,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.15000000000000002,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.6039215686274509,
									0.8509803921568627,
									1
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}