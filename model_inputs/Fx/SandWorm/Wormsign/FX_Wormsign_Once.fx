{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 0,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"scaleX": 300,
			"scaleY": 300,
			"scaleZ": 300,
			"color": -16250872,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.4,
			"scaleX": 0.4,
			"scaleY": 0.4,
			"scaleZ": 0.4,
			"children": [
				{
					"type": "model",
					"name": "FX_Mesh_Disc",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_4.fbx",
					"z": -0.5,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
					"rotationZ": -180,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "DecalPass",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"materialName": "any",
							"mainPassName": "decal"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2.5,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"wrap": true,
								"invert": true,
								"replace": false,
								"alpha": 0.9,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 2,
								"scaleY": 2,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0.002,
								"shiftSpeedY": 0
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.23,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.03,
									0
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
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
								"progress": 0.26,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.03,
									0
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScaleX": 1,
								"texScaleY": 1,
								"tex": "Fx/noise/causticTexture_04.jpg",
								"intensity": 3,
								"scrollSpeed": [
									0,
									0.02
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "intensity",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 4,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleX",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 3,
											"value": 0.8,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleY",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 3,
											"value": 0.9,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 1,
								"power": 0.5
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
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
											}
										}
									]
								}
							]
						},
						{
							"type": "fakeLight",
							"name": "FakeLight",
							"props": {
								"tag": "WIP"
							},
							"normalMap": "Fx/Alphas/sand_gaussian.png",
							"topBrighten": true,
							"topIntensity": 0.4,
							"topSpan": 0.3,
							"dirIntensity": 0.1,
							"dirSpan": 0,
							"sandBlend": 0.7,
							"envBlend": 0.6
						}
					]
				}
			]
		}
	]
}