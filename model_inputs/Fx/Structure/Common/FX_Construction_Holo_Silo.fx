{
	"type": "fx",
	"duration": 120,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Zone_Holo_cylinder",
					"source": "Fx/Meshes_Common/CylinderCone_Small.fbx",
					"x": 0.04,
					"y": 0.016,
					"z": 0.05600000000000001,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 0.7,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"textureWrap": true,
									"emissive": 1
								}
							},
							"wrapRepeat": true,
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
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl05u_A.jpg",
								"onDecal": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.7395410261699588,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.339108920584512,
											"value": 0.09999999999999998,
											"mode": 2
										},
										{
											"time": 16.939093380863408,
											"value": 1,
											"mode": 2
										},
										{
											"time": 16.939093380863408,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.36,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 0.3,
								"texture": "Fx/Alphas/T_Scan_Constru.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.02
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keys": [
										{
											"time": 2.9956536459946084,
											"value": 0.5166666666666667,
											"mode": 2
										},
										{
											"time": 4.607876095906251,
											"value": 0.9166666666666667,
											"mode": 2
										},
										{
											"time": 7.014213415011767,
											"value": 0.9666666666666667,
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
									0.5333333333333333,
									0.8,
									0.7803921568627451
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 2,
								"power": 0.8
							}
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 7,
					"scaleY": 7,
					"scaleZ": 3,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"renderMode": "BeforeTonemapping",
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"textureWrap": true,
									"emissive": 1
								}
							},
							"wrapRepeat": true,
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
								"alpha": 0.6,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad02.jpg",
								"onDecal": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"loop": true,
									"keys": [
										{
											"time": -6.938893903907228e-18,
											"value": 0.033333333333333354,
											"mode": 2
										},
										{
											"time": 0.7,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4410989067285844,
											"value": 0.04999999999999999,
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
									0.5333333333333333,
									0.8,
									0.7803921568627451
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.953542642104598,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.9532048818579293,
											"value": 1,
											"mode": 2
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