trigger LeadRoundRobinTrigger on Lead (before insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRoundRobinHandler.handleBeforeInsert(Trigger.new);
    }
}
