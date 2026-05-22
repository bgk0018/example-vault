%% This runs on startup to create the day, week, month, quarter, and year notes for today if they haven't been created yet %%  
<%*  
let today = moment();

let journal = [  
	{ template: "f-daily", fileName: today.format("YYYY-MM-DD"), directory: "journal/1-daily"},  
	{ template: "f-weekly", fileName: today.format("gggg-[W]ww"), directory: "journal/2-weekly"},  
	{ template: "f-monthly", fileName: today.format("YYYY-MM"), directory: "journal/3-monthly"},  
	{ template: "f-quarterly", fileName: today.format("YYYY-[Q]Q"), directory: "journal/4-quarterly"},  
	{ template: "f-yearly", fileName: today.format("YYYY"), directory: "journal/5-yearly"},  
];  

for (const entry of journal) {  
	if(!(await tp.file.exists(`${entry.directory}/${entry.fileName}.md`))){  
		 await tp.file.create_new(  
			tp.file.find_tfile(entry.template),  
			entry.fileName,  
			false,  
			app.vault.getAbstractFileByPath(entry.directory));  
	}  
}  
-%>
