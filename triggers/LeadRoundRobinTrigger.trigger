trigger LeadRoundRobinTrigger on Lead (before insert, after insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRoundRobinHandler.handleBeforeInsert(Trigger.new);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadRoundRobinHandler.handleAfterInsert(Trigger.new);
    }
}
