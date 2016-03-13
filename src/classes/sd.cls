global class sd implements Schedulable{
   
   global void execute(SchedulableContext sc) {
     schdleClsDlt sd = new schdleClsDlt();
     database.executebatch(sd,10);
   }
}