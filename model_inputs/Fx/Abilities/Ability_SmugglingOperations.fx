{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 250,
			"scaleY": 250,
			"scaleZ": 250,
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
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Volutes",
					"z": 2,
					"children": [
						{
							"type": "model",
							"name": "Sand",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 55.5,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"textureWrap": true,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.23,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0.5,
											0.5
										],
										"uvShiftSpeed": [
											-0.02,
											-0.015
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.23,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1.5
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "SpiralDark",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 37,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.02,
											-0.03
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.23,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0.2
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
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
										"range": 1,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.8,
										"color": [
											0.19607843137254902,
											0.011764705882352941,
											0.1411764705882353
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.6,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.25
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "SpiralDark",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 25.9,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"textureWrap": true
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0.5,
											0.5
										],
										"uvShiftSpeed": [
											-0.02,
											-0.015
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.45,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
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
										"range": 1,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.8,
										"color": [
											0.19607843137254902,
											0.011764705882352941,
											0.1411764705882353
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.6,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.7
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"z": -0.36749,
					"scaleX": 200,
					"scaleY": 200,
					"scaleZ": 17,
					"albedoMap": "Fx/Gradients/circGrad01.png",
					"fadeStart": 0.08,
					"renderMode": "AfterTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 0.8,
								"color": [
									0.19607843137254902,
									0.011764705882352941,
									0.1411764705882353
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							}
						}
					]
				}
			]
		}
	]
}