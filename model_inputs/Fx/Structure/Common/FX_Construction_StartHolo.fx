{
	"type": "fx",
	"duration": 12,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"children": [
				{
					"type": "model",
					"name": "Zone_StartHolo",
					"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
					"rotationY": 90,
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
								"texture": "Fx/Gradients/T_Square03.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.9833333333333334,
											"mode": 2
										},
										{
											"time": 0.9949999999999999,
											"value": 0,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
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
						}
					]
				}
			]
		}
	]
}