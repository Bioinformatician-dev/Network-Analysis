# Load necessary libraries
library(igraph)
library(Bioconductor)

# Create a sample protein-protein interaction network
edges <- data.frame(from = c("ProteinA", "ProteinB", "ProteinC", "ProteinA", "ProteinD"),
                    to = c("ProteinB", "ProteinC", "ProteinD", "ProteinC", "ProteinA"))

# Construct the graph
g <- graph_from_data_frame(edges, directed = FALSE)

# Plot the network
plot(g, vertex.label = V(g)$name, vertex.size = 30, edge.arrow.size = 0.5)

# Analyze the network
summary(g)
degree_distribution <- degree(g)
clustering_coefficient <- transitivity(g)

# Print results
print(degree_distribution)
print(clustering_coefficient)
