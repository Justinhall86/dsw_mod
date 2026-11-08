{
	"type": "fx",
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Inter",
			"enabled": false,
			"z": 1,
			"scaleX": 12.25,
			"scaleY": 12.25,
			"scaleZ": 0.98,
			"kind": 1,
			"args": [
				48,
				360,
				0,
				4
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
							"culling": "Back",
							"depthTest": "LessEqual",
							"colorMask": 15,
							"enableStencil": false,
							"alphaKill": false
						}
					},
					"diffuseMap": "Fx/Gradients/z_FillBlack.jpg"
				},
				{
					"type": "shader",
					"name": "AutoAlpha",
					"source": "shaders/AutoAlpha.hx",
					"enabled": false,
					"props": {
						"scale": 1
					}
				}
			]
		}
	]
}